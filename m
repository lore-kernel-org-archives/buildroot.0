From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 15:28:56 +0200
Subject: [Buildroot] [PATCH 1/2] automake: update gtk-doc.m4 to serial 2
In-Reply-To: <5437BF0F.8040009@zacarias.com.ar>
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
 <20141010124101.0388b2b3@free-electrons.com>
 <5437B8B3.7070105@zacarias.com.ar>
 <20141010130114.71fd0a73@free-electrons.com>
 <5437BF0F.8040009@zacarias.com.ar>
Message-ID: <20141010152856.19129c7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 10 Oct 2014 08:12:15 -0300, Gustavo Zacarias wrote:

> > Yes, correct, that's my idea. I think it's more correct than globally
> > adding this host-pkgconf dependency.
> 
> "When you autoreconf you might need host-pkgconf in DEPENDENCIES whereas
> you didn't before"... really?

Come on Gustavo, no need to start being aggressive here.

Yes, that's exactly what I suggest. And actually, we already need to
add host-pkgconf in DEPENDENCIES when doing autoreconf, if the
configure.ac uses PKG_CHECK_MODULES, which is far more common than
packages using gtk-doc.m4 specifically.

PKG_CHECK_MODULES in configure.ac requiring host-pkgconf in the
DEPENDENCIES is precisely the reason why I proposed
http://patchwork.ozlabs.org/patch/340902/ some time ago. Nothing
prevents from adding a similar check to see if the package uses
the gtk-doc.m4 macros or not. That would at least warn loudly if such
macros are used without the package having host-pkgconf in its
dependencies.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
