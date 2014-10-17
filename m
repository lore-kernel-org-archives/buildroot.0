From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 17 Oct 2014 10:18:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-16
In-Reply-To: <20141017063014.93147100E7E@stock.ovh.net>
References: <20141017063014.93147100E7E@stock.ovh.net>
Message-ID: <20141017081830.GA24868@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Let's look at today's winner: libgtk3!

On Fri, Oct 17, 2014 at 08:30:14AM +0200, Thomas Petazzoni wrote:

>      powerpc |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/8d30687f92178de15d7697a7b8a1b7e2d6e93deb/

CUPS is not found. This has already been fixed by
a9c30099aaac4c51c7af42d0a9853797f06137d6.

>      powerpc |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/03c2673b80e00944a41fc43d51895e4d751b4be5/

Problem linking with -lint when building with ucLibc. It might be related to
the AM_GLIB_GNU_GETTEXT stuff I mentionned in the Makefile.

>          arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/5e43d57832910c8a12be9fa0e026b38b2ab22304/

Another CUPS.

>      powerpc |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/75f93cea8ab59f052ddefa51c0bfc14c3df47a60/

-lint again.

>         i686 |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/db6cd8922444490056bf5157fc0c9349e9bf383b/

One more CUPS.

>       mipsel |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/e0c2623e2d400ce66963eae23f136c0158556b36/

Problem generating the build tool extract-string. When bumping to 3.14, I had
to make this tool built by host-libgtk3 (same as gtk-update-icon-cache).

>         mips |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/9259fc11d5c7c0c60ac2fdc0c3a49d0f5cc54fcc/

(Too many) CUPS.

>          arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/5bf66b8d16a3ddded24827bf278ad24b55ded6e7/

-lint again, and again.

>          arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/4bdcd642eaa880dbbfbed8f4ed5ffac0c52edaa8/

-lint again, and again, and again.

>          sh4 |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/a6fa99088bb21abc97f38ff963f13ad7f8499095/

-lint, ...


I will look at the -lint and extract-string issues and see if these issues are
resolved in 3.14.3 or if more fixing is needed.

Best regards
ELB
