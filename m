From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Oct 2019 18:47:17 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <20191016154850.0d093c4d@windsurf>
References: <20191016111927.14208-1-nolange79@gmail.com>
 <20191016111927.14208-3-nolange79@gmail.com>
 <20191016154850.0d093c4d@windsurf>
Message-ID: <20191016164717.GF14656@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Norbert, All,

On 2019-10-16 15:48 +0200, Thomas Petazzoni spake thusly:
> On Wed, 16 Oct 2019 13:19:25 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
> > Automatically check for an available meson tool,
> > and use it as long as the version is fitting.
> 
> Thanks for this, however I don't think we will ever merge this until a
> system-provided meson can effectively be used.

I do agreee with that.

However, I guess that what Norbert is trying to do, is to build their
own meson that they patched with our patch, thus achieving the
"system-provided meson is capable" status.

But if we're going that way for meson, why not do the same for all the
other host tools we do build? That would be totally unfeasible.

So, I am still not convinced by this feature, until we can at least
detect that a system-provided meson is capable, and that we can decide
by actually asking that meson (e.g. by checking the version, or dumping
its help for options, or whatevs...).

> What about working on merging
> 0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch to upstream
> Meson, in this form or another form ? This would definitely pave the
> way to using the system-provided Meson.
> 
> Another (more useful ?) thing to look at: is it possible to use the
> system-provided Python for Meson and Ninja, when python3 is provided by
> the system ? I think Meson and Ninja by themselves are not long at all
> to build, and it would be a much more useful direction for this patch
> series.

But then, it should be done very carefully: if the hot-python3 must
otherwise be built (because something else forcibly depends on it), then
our host-meson must also be using that host-python3 too, otherwise, we
could end up with a host-meson built with the system-provided python3
but run with our host-python3.

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
