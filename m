From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 22:50:43 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
In-Reply-To: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
Message-ID: <20160507225043.56bdc54f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 22:21:14 +0200, Beno?t Mauduit wrote:

> +Original commit from "popcornmix" [0], and fixed by "wsnipex" [1] on Kodi branch master.
> +Commit-id in xbmc/kodi upstream git :
> +[0] Commit-id : 253ec417519afe9415612add80ff5a1753208b75
> +[1] Commit-id : 1da2f07be715865bf7cf9731d7147dc4f43459be

In these are two patches upstream, then it should be two patches in
Buildroot as well.

> +
> +Addition to original patches :
> + * Add optimization flag for rpi2 in main xbmc build
> + * Add -mtune & -mvectorize-with-neon-quad flag in "tools/depends" build

Why are you doing those additional changes compared to upstream?

Like Yann said, we prefer to not backport too much stuff, except when
it's actually fixing a problem (which is not the case here).

Yann, will you send a patch that reverts your commit adding explicit RPi
2 support in the Kodi package ? This way we can have this for 2016.05,
and when a new Kodi release is done with built-in support for RPi2, we
can revisit this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
