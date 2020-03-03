From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Mar 2020 00:04:18 +0100
Subject: [Buildroot] Beaglebone support
In-Reply-To: <CABhNV22j46zXYJimCgP7Z-VK=kbbosiQr0V7ObVW0Y3cW-VVZg@mail.gmail.com>
 ("Einar =?utf-8?Q?J=C3=B3n=22's?= message of "Sun, 1 Mar 2020 14:55:33
 +0100")
References: <CAPmASeu4KLNSK=nkgb04C4UKwTsDfjyZ0RXOCkF2r3yWyHYWJg@mail.gmail.com>
 <CABhNV22j46zXYJimCgP7Z-VK=kbbosiQr0V7ObVW0Y3cW-VVZg@mail.gmail.com>
Message-ID: <87lfohavm5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Einar" == Einar J?n <tolvupostur@gmail.com> writes:

 > Hello Andrea, Sebastien
 > Sorry for the late response. I've been meaning to build and fix the qt5 for
 > beaglebone, but I'm in the middle of switching jobs and moving countries,
 > and I don't have the buildroot repo.
 > The beaglebone_qt5_defconfig should mostly work with the latest addition of
 > new ti-sgx drivers (added in November or so). It now builds the latest
 > drivers for ti-sgx (which finally builds the KMS plugin for QT), and
 > QtMultimedia should work. I have been building QtMultimedia and QtWebEngine
 > with the old ti-sgx drivers and writing directly to the frame buffer (no
 > acceleration because KMS plugin wouldn't build, no Weston) for over a year.

 > I haven't tried that exact setup since the addition, but you probably need
 > to add
 > BR2_KERNEL_NEEDS_OPENSSL=y
 > for it to build. Compare beaglebone_qt5_defconfig to beaglebone_defconfig
 > for exact spelling of this option.

Notice that this has been fixed in commit 128c57adb8f3a4e1af2b9, which
is part of 2020.02-rc3.

-- 
Bye, Peter Korsgaard
