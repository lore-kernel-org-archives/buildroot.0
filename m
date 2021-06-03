From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Jun 2021 08:20:01 +0200
Subject: [Buildroot] EUDEV takes a very long time to load the Wifi
 firmware
In-Reply-To: <CAOMZO5CcUAt1kBQ4W-nu6U4KP40UbSwa4ohFBq42dDNresANHw@mail.gmail.com>
 (Fabio Estevam's message of "Wed, 2 Jun 2021 20:00:15 -0300")
References: <CAOMZO5CcUAt1kBQ4W-nu6U4KP40UbSwa4ohFBq42dDNresANHw@mail.gmail.com>
Message-ID: <87sg1zzcz2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Hi,
 > I am running kernel 5.12.4 on an imx6dl-pico-pi board with a QCA9377 Wifi chip.

 > Originally I was selecting BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y,
 > but that caused the QCA9377 firmware to be loaded only after almost 3
 > minutes.

 > Changing it to BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y caused the
 > QCA9377 firmware to be loaded very quickly as expected.

 > I am using a recent master version of Buildroot:
 > ab9ceea782c770acdb9a25d8601b12af261c8ccb

 > I am OK with using MDEV but just wanted to report it in case someone
 > knows if this is a known EUDEV issue.

Is there anything of interest in the logs? The eudev init script runs
udevadm settle, does that take a long time or perhaps even times out?

-- 
Bye, Peter Korsgaard
