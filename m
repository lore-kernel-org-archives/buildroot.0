From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 08:14:44 +0200
Subject: [Buildroot] [PATCH v6 19/28] core/pkg-infra: Add per-package
 support in qmake infra
In-Reply-To: <20200217212350.29750-20-anaumann@ultratronik.de> (Andreas
 Naumann's message of "Mon, 17 Feb 2020 22:23:41 +0100")
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-20-anaumann@ultratronik.de>
Message-ID: <87pn8qr9uz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Naumann <anaumann@ultratronik.de> writes:

 > Qmake configured packages will, by default, use the absolute HostPrefix/Sysroot
 > pathes set during configuration/building of qt5base for their install
 > destinations.
 > For the per-package host/staging infrastructure, this causes non-qt5base
 > packages to litter the qt5base folders. In addition, buildroots target-install
 > step subsequently fails because the respective files are missing from the
 > per-package sysroot of the package itself.

 > Fortunately, qmake's built-in pathes can be overridden by placing a custom
 > qt.conf next to the qmake binary. This is already used to facilitate SDK
 > relocation. So for per-package path manipulation we can reuse that method, but
 > need to change the host/sysroot values according to each per-package
 > path.

 > Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
