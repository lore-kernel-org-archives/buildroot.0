From: Christian Stewart <christian@paral.in>
Date: Fri, 17 Jul 2020 23:31:38 -0700
Subject: [Buildroot] [RFC] Buildroot running on the NVIDIA Tegra TX2 devkit
Message-ID: <CA+h8R2qEcwbkWAT_deTkAKHdqPpvraskuOr3bnTvsYFu9YZY6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I spent some time and managed to get Buildroot to run on the NVIDIA
Tegra TX2 via my SkiffOS project, which simply combines together
different configuration fragments.

There is a buildroot package added as an extension which downloads
Linux4Tegra and marks the licenses correctly (I hope).

The system can be flashed by booting it into recovery mode (holding
the REC button while starting) and running the "flash_usb.sh" script,
which calls into T4L's flash.sh script, pointed to the Buildroot
images output directory.

The kernel, u-boot, and rootfs (as ext4) are flashed, and the
opportunity for custom kernel arguments or boot-up behavior is there
as well.

RFC, if there's interest I can format into a Buildroot mainline defconfig.

Stable commit link:

https://github.com/paralin/SkiffOS/commit/6dc2b3f249e5d76018271ae00cff5029ff15b7da

Best regards,
Christian Stewart
