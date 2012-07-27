From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 08:55:40 +0200
Subject: [Buildroot] [PATCH] at91bootstrap: bump version to 3.2
In-Reply-To: <1343248264-6435-1-git-send-email-spdawson@gmail.com>
References: <1343248264-6435-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120727085540.211a4709@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 25 Jul 2012 21:31:04 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  boot/at91bootstrap/Config.in                       |   28 +-
>  .../at91bootstrap-1.16-eabi-fix.patch              |  334 ---------
>  .../at91bootstrap-1.16-u-boot-relocation-fix.patch |  299 --------
>  .../at91bootstrap-3.2-u-boot-relocation-fix.patch  |  750 ++++++++++++++++++++
>  boot/at91bootstrap/at91bootstrap.mk                |   34 +-
>  5 files changed, 769 insertions(+), 676 deletions(-)
>  delete mode 100644 boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
>  delete mode 100644 boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
>  create mode 100644 boot/at91bootstrap/at91bootstrap-3.2-u-boot-relocation-fix.patch

For this package, I am not sure we can do a simple version bump. Since
there is (was?) no upstream for AT91Bootstrap 1.x, many
vendors/companies had to maintain their patches on top of AT91Bootstrap
1.x. See for example
board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch. Therefore,
removing AT91Bootstrap 1.x from the tree will prevent those platforms
to work. I know people should upgrade, but AT91Bootstrap 3.x is quite
significantly different, so the porting effort is not that simple.

Therefore, I'm wondering whether we should kee at91bootstrap as it is,
and create a separate package at91bootstrap3 for the 3.x generation.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
