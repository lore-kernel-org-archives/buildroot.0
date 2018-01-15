From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 20:56:28 +0100
Subject: [Buildroot] Adding Flex library
In-Reply-To: <CAEjFr-aN64GGtExE8VwWsu=c5CadSvh+M1Pzm-Q10gBSY9_3aA@mail.gmail.com>
References: <CAEjFr-aN64GGtExE8VwWsu=c5CadSvh+M1Pzm-Q10gBSY9_3aA@mail.gmail.com>
Message-ID: <20180115205628.4da9ac69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 20:53:56 +0200, Doha Ehab wrote:

>  I am using buildroot-2017.02.9*. *I have chosen flex library from target
> packages -> Development Tools. My question is, am I supposed to find the
> flex binary under output-> host ->usr->bin? I checked the Config.in for
> flex and the package address is incorrect (http://flex.sourceforge.net/)

"Target packages" are target packages, so they are cross-compiled and
installed in the target filesystem, i.e output/target, and are
therefore present in the filesystem images generated in output/images.

If you need the host variant of flex (i.e built with the native
compiler) then your package should have a dependency on host-flex.
There is no option in menuconfig to enable host-flex, because it is
generally just a build dependency of another package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
