From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 22:07:47 +0200
Subject: [Buildroot] [PATCH 16/28] u-boot: convert to GENTARGETS
In-Reply-To: <1b701e02eb384f3f3156106699a7d6598ed614f4.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:54:07 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <1b701e02eb384f3f3156106699a7d6598ed614f4.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mxglyk4s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The feature of building mkimage for the target is removed, it wasn't
 Thomas> building with current U-Boot, and doesn't make a lot of sense (mkimage
 Thomas> is needed only to prepare a kernel image, or an U-Boot script).

That's the primary use, yes - But mkimage -l is sometimes also handy on
the target. I've worked on a project where we used it to see the current
versions in flash (similar to the imls command in u-boot).

But ok, not that common a feature - Committed, thanks.

 Thomas> The feature of building mkimage for the host is moved to a proper
 Thomas> package. It duplicates a few things (U-Boot URL, etc.) but it makes
 Thomas> things a lot cleaner than having it handled by boot/u-boot/u-boot.mk.

It probably makes sense to move fw_printenv there as well.

-- 
Bye, Peter Korsgaard
