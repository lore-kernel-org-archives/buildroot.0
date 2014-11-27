From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 11:39:27 +0100
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
In-Reply-To: <20141127103503.GS2374@sapphire.tkos.co.il> (Baruch Siach's
 message of "Thu, 27 Nov 2014 12:35:03 +0200")
References: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
 <87fvd5oz47.fsf@dell.be.48ers.dk>
 <20141127081201.GQ2374@sapphire.tkos.co.il>
 <87bnntow3h.fsf@dell.be.48ers.dk>
 <20141127101500.GR2374@sapphire.tkos.co.il>
 <877fyhos9l.fsf@dell.be.48ers.dk>
 <20141127103503.GS2374@sapphire.tkos.co.il>
Message-ID: <873895orkw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> The only thing that comes to mind is that you are creating a cpio:
 >> 
 >> fs/cpio/cpio.mk:PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)

 > You are right that I was creating a cpio, but apparently that's not the cause. 
 > Disabling the cpio image followed by 'make clean; make' didn't remove 
 > /dev/console. The code at fs/cpio/cpio.mk indicates that the above line always 
 > takes effect when !BR2_ROOTFS_DEVICE_CREATION_STATIC regardless of 
 > BR2_TARGET_ROOTFS_CPIO.

Ahh yes, that's a bug (but pretty harmless).

-- 
Peter Korsgaard 
