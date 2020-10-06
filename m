From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 17:00:29 +0200
Subject: [Buildroot] [PATCH 0/7] SELinux tests
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20201006170029.39c20e9b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Antoine,

On Mon, 28 Sep 2020 16:54:18 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> Antoine Tenart (7):
>   support/testing: add an SELinuxSystemdExt4 test
>   support/testing: add an SELinuxSystemdSquashfs test
>   support/testing: add a test for BR2_REFPOLICY_EXTRA_MODULES
>   support/testing: add a test for BR2_REFPOLICY_EXTRA_MODULES_DIRS
>   support/testing: add a test for BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
>   support/testing: add tests for the packages SELinux functionalities
>   DEVELOPERS: update my watchlist

Thanks a lot, I have applied the whole series, but after doing a number
of changes:

 - Switched to using an external toolchain for the SELinux
   ext4/squashfs systemd tests. This greatly reduces the build time.

 - Moved the SELinux ext4/squashfs systemd tests to init/ tests instead
   of boot/ tests. Indeed, boot/ is really for bootloader related tests.

 - Moved the update of the DEVELOPERS file to each individual commit
   adding a new test-related file. Of course, the addition of
   libselinux/refpolicy on your watch list was kept as a separate patch.

 - Some minor update of the commit titles.

I've also pushed a preparation commit that fixes the variable expansion
issue we have discussed, and which was exhibited by one of the tests
you have contributed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
