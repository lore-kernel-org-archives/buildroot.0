From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Nov 2015 21:58:29 +0100
Subject: [Buildroot] [PATCH] core/printvars: allow dumping a set of
 variables
In-Reply-To: <20151104214556.11e5b4b8@free-electrons.com>
References: <1446666042-6051-1-git-send-email-yann.morin.1998@free.fr>
 <20151104214556.11e5b4b8@free-electrons.com>
Message-ID: <20151104205829.GE4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-04 21:45 +0100, Thomas Petazzoni spake thusly:
> On Wed,  4 Nov 2015 20:40:42 +0100, Yann E. MORIN wrote:
> > Dumping our 176164 variables can take quite some time (~12s here). What
> > takes the most time is sorting the variables (~9s), followed by the
> > parsing of our Makefiles (~3s), with the actual printing in the noise.
> > 
> > However, sometimes only one or a few variables are needed. For example,
> > one may want to retrieve the Linux build dir from a post-build hook (to
> > get the Linux' actual .config after our fixups and check for various
> > features).
> > 
> > Add the possibility to only dump the variables listed in $(VAR) which
> > must be passed as a make argument, like so:
> > 
> >     $ make -s printvars VARS="LINUX_DIR TOPDIR O"
> >     LINUX_DIR=/home/ymorin/dev/buildroot/O/build/linux-4.3 ($(BUILD_DIR)/$(LINUX_BASE_NAME))
> >     O=/home/ymorin/dev/buildroot/O/. (/home/ymorin/dev/buildroot/O/.)
> >     TOPDIR=/home/ymorin/dev/buildroot/buildroot (/home/ymorin/dev/buildroot/buildroot)
> > 
> > This is much faster (the time is just about the time it takes to parse
> > our Makefiles, 3s here) and easier to parse.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I haven't thought about the implementation, but it possible to support
> wildcards, like LIBFOO_* or LIBFOO_% ?

I'll look at it...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
