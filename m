From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Sep 2019 20:24:37 +0200
Subject: [Buildroot] [PATCH] configs/lafrite: new defconfig
In-Reply-To: <20190915160235.10d486be@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 15 Sep 2019 16:02:35 +0200")
References: <20190914055621.19573-1-peter@korsgaard.com>
 <20190915160235.10d486be@windsurf.home>
Message-ID: <878sqp4dui.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sat, 14 Sep 2019 07:56:20 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Add basic support for the Libre Computer "La Frite" SBC.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> .gitlab-ci.yml                                |  1 +
 >> DEVELOPERS                                    |  2 ++
 >> board/librecomputer/lafrite/genimage.cfg      | 10 ++++++
 >> .../lafrite/overlay/extlinux/extlinux.conf    |  4 +++
 >> board/librecomputer/lafrite/readme.txt        | 34 +++++++++++++++++++
 >> configs/lafrite_defconfig                     | 20 +++++++++++
 >> 6 files changed, 71 insertions(+)
 >> create mode 100644 board/librecomputer/lafrite/genimage.cfg
 >> create mode 100644 board/librecomputer/lafrite/overlay/extlinux/extlinux.conf
 >> create mode 100644 board/librecomputer/lafrite/readme.txt
 >> create mode 100644 configs/lafrite_defconfig

 > Applied to master, thanks. I guess the reason for not building a
 > bootloader is that it is stored in some other non-volatile storage on
 > the board ?

Yes, U-Boot is in the 16MB SPI flash. It uses the normal distro bootcmds
and supports USB, so it nicely boots from a suitable rootfs on a USB
flash drive.

-- 
Bye, Peter Korsgaard
