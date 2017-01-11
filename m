From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jan 2017 08:16:52 +0100
Subject: [Buildroot] 'orangepi_one_defconfig' build issue
In-Reply-To: <58759972.50708@sbcglobal.net> (paul's message of "Tue, 10 Jan
 2017 18:33:22 -0800")
References: <58759972.50708@sbcglobal.net>
Message-ID: <87eg0ajcbf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "paul" == paul  <paul.arssov@sbcglobal.net> writes:

 > Hi,
 > I did a build for orange-pi' board based on the recently posted
 > 'orangepi_one_defconfig' , using buildroot-2016-11. There is this
 > error coming -
> --------------------
 >       ...
 > if ! support/scripts/check-kernel-headers.sh
 > /media/p/data/ai-robo/bld-lnx/buildroot-2016.11/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot 

 > 4.8; then exit 1; fi
 > Incorrect selection of kernel headers: expected 4.8.x, got 4.9.x

The new orangepi_one_defconfig uses kernel / headers 4.9 which weren't
available in the 2016.11 release. You can either try to change it to use
kernel 4.8 or build against current git which does have 4.9 support.

-- 
Bye, Peter Korsgaard
