From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 00:00:32 +0200
Subject: [Buildroot] [RFC v2 0/5] common service startup files
In-Reply-To: <20150406105122.4b13f5b0@free-electrons.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
 <20150406105122.4b13f5b0@free-electrons.com>
Message-ID: <20150421220032.GC4262@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, Thomas, All,

On 2015-04-06 10:51 +0200, Thomas Petazzoni spake thusly:
> On Mon, 6 Apr 2015 01:01:19 +0300, Alex Suykov wrote:
> > This series is intended to simplify and clean up installation routine
> > for daemon-like applications, merging sysv and systemd startup files
> > and moving much of the common code out of per-package .mk files.
> 
> Thanks a lot for working on this.
> 
> To be honest, my feeling is that I don't really like Buildroot to
> invent its own "abstract" language to describe the initialization of
> services, then used to generate SysV and Systemd unit files.

Totally agreed on my side.

> There are two main reasons for this feeling.
> 
> First of all, because the philosophy of Buildroot is to not invent new
> language, or add layers on top of what exists: we use Kconfig for the
> configuration, make for the package building logic, shell and Python
> scripts in some situations. This is all standard, and generally well
> known by most Linux developers. Even though the language you propose
> for describing the initialization of services is certainly not very
> complicated, it remains a layer on top of what really happens.
> 
> Second, such abstract languages usually appear simple initially. But
> then, some corner cases show up, with cases that can easily be solved
> in shell scripts or systemd unit files, but were not planned in this
> small abstract language. So it has to be extended. Again, and again. To
> finally become as complicated as the shell scripts or systemd unit
> files.

Been there, done that. Indeed.

> Of course, my opinion is just one amongst many other Buildroot
> developers, and if all other Buildroot developers are convinced that
> this is the way to go, then we'll do it. But since not many people
> gave their opinion about this, I thought I would simply give mine.

Well, it's always difficult to state an opinion on such a series. I have
the gut-feeling that it is "not good", but just stating so is not
sufficient to coment on it. You've expressed quite nicely my feelings
bout this. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
