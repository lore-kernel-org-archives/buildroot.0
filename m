From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 11:52:55 +0200
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <20200425120825.GP5035@scaer> (Yann E. MORIN's message of "Sat,
 25 Apr 2020 14:08:25 +0200")
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
 <20200425120825.GP5035@scaer>
Message-ID: <87k11mrbwo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Timo, All,
 > On 2019-09-23 10:58 +0000, Timo Ketola spake thusly:
 >> When booting with 'console=<empty>' in the kernel command line (as e.g.
 >> U-Boot does with silent flags in effect), opening /dev/console fails.
 >> That is fatal in the /init script and kernel will panic. It is also
 >> needless, because the kernel tries to open it anyway (well, as long as
 >> we have console node in initramfs /dev; cpio.mk creates that alright).
 >> 
 >> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

 > I've applied to master, after extending the commit log with all the gory
 > details explaininng why we can indeed safely remove those redisrections
 > now.

 > Thank you for the patience on this patch.

 > Thanks also to Peter for helping on IRC about this research.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
