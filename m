From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  6 Nov 2017 13:16:49 +0300
Subject: [Buildroot] [PATCH v2] orange-pi-zero: misc updates
Message-ID: <20171106101652.28861-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is the second iteration of the patchset which aimes at enabling WiFi
on orange-pi-zero board right out-of-the-box. The first approach suggested
to pull xr819 WiFi chip firmware from armbian repositories.

Meanwhile it turned out that Armbian project created a separate github
repository to keep firmware binary blobs for all their supported boards.
Reviewers (Peter Korsgaard and Yann E. Morin) suggested to use new
Armbian firmware repository and organize access to firmware files
in a similar way to what linux-firmware does.

Regards,
Sergey


Sergey Matyukevich (3):
  armbian-firmware: new package
  orange-pi-zero: add xr819 firmware
  DEVELOPERS: add myself to several packages

 DEVELOPERS                                     |    7 +++
 configs/orangepi_zero_defconfig                |    5 +-
 package/Config.in                              |    1
 package/armbian-firmware/Config.in             |   21 +++++++++
 package/armbian-firmware/armbian-firmware.hash |    2
 package/armbian-firmware/armbian-firmware.mk   |   53 +++++++++++++++++++++++++
 6 files changed, 88 insertions(+), 1 deletion(-)
