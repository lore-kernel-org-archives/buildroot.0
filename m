From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Mar 2013 19:18:00 +0100
Subject: [Buildroot] [PATCH v2] gdb: convert to the package
	infrastructure
In-Reply-To: <20130320152122.0e661e86@skate>
References: <1363720308-12881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201303192134.32575.yann.morin.1998@free.fr> <20130320152122.0e661e86@skate>
Message-ID: <201303201918.01014.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 20 March 2013 Thomas Petazzoni wrote:
> On Tue, 19 Mar 2013 21:34:32 +0100, Yann E. MORIN wrote:
> > There is a little inconsistency in the available choices:
> >     Toolchain  --->
> >         [ ] Copy gdb server to the Target
> > 
> > is still available, even if:
> >     Package Selection for the target  --->
> >         Debugging, profiling and benchmark  --->
> >             [*] gdb
> >             [*]   gdbserver
> > 
> > I think it does not make sense to both copy the gdbserver from the
> > toolchain, *and* build our own version.
> 
> Yes. I don't think it's really "inconsistent", but can certainly be
> improved. I was thinking of doing that sort of improvement as a second
> step.

Yes, not really an inconsistency per-se, sorry for the bad phrasing.
Yes, an incremental change is OK by me. :-)

[--SNIP--]
> > So I would suggest that, if we build the gdb (on the target) and/or the
> > gdbserver, then the host cross-gdb version should not be selectable, and
> > should be deduced from the version used to build the gdb (on the target).
> 
> It is already the case. Look at gdb.mk:
[--SNIP--]
> As the comment explains, if you have selected cross-gdb, then
> BR2_GDB_VERSION will be non-empty (defined in
> package/gdb/Config.in.host) and we will use this version to build
> gdbserver and the gdb on the target. If no cross-gdb has been selected,
> then we will use some default version (6.6a, 6.7.1 or 7.5 depending on
> the architecture).
> 
> Doesn't that solve the issue you're raising?

As far as I can see, yes. Sorry, I really misssed that part of the .mk.

Thanks for the clarifications! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
