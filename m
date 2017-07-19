From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:40:13 +0200
Subject: [Buildroot] [git commit] xvisor: fix build on AArch64
In-Reply-To: <20170705202947.AB27B81F86@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 5 Jul 2017 22:30:55 +0200")
References: <20170705202947.AB27B81F86@busybox.osuosl.org>
Message-ID: <87vamoa6ki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=117fd5dfbc756c4f2b4aef97fc2b568528c66df7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Xvisor was failing to build on AArch64 with:

 > package/xvisor/xvisor.mk:60: *** No Xvisor defconfig name specified, check your BR2_PACKAGE_XVISOR_DEFCONFIG setting.  Stop.

 > The first problem is that the Config.in file had a typo: it was using
 > BR2_AARCH64 instead of BR2_aarch64, and therefore the
 > BR2_PACKAGE_XVISOR_DEFCONFIG variable had no value.

 > Once this is fixed, another problem occurs: the ARCH variable needs to
 > be specified as "arm" for XVisor, for both ARM and AArch64. Therefore,
 > a XVISOR_ARCH variable is introduced, which is calculated according to
 > the Buildroot configuration options. Only x86-64, arm and aarch64 are
 > supported by Xvisor currently, so it remains simple.

 > Fixes:

 >   http://autobuild.buildroot.net/results/1719a63ff257f13634a06a14327abfb327984101/

Committed (+ the followup fix) to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
