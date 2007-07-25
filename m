From: Benjamin Tietz <benjamin@micronet24.de>
Date: Wed, 25 Jul 2007 22:00:39 +0200
Subject: [Buildroot] BASE_TARGETS aren't build
Message-ID: <20070725200039.GA26294@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

some days ago the building of the toolchain and the crosscompiler was
moved from TARGETS to BASE_TARGETS, and the second made dependent of the
first. It looked nice, but at least for me, it doesn't work.

Getting a virgin buildroot building all the packages (and the toolchain)
doesn't take this dependency in account and starts to compile packages
for the target. Without an working gcc this may be difficult...

There were a rule, some time ago - never break the build - where is it
gone. Some time ago the buildroot built, even for avr32, without to much
problems. There going discussions on about distributional packages and BSPs.
But as long as the toolchain doesn't built, all these gimmicks aren't
usable.

By the way that problem isn't the only thing broken at the moment; I
fixed it by now by reverting the patch and letting the toolchain compile
as usual targets.

regards

Benjamin
