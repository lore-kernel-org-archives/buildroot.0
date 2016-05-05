From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 May 2016 11:31:46 +0200
Subject: [Buildroot] [PATCH] uboot: ensure u-boot-dtb.img gets built if
	enabled
In-Reply-To: <1462224412-836-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Mon, 2 May 2016 23:26:52 +0200")
References: <1462224412-836-1-git-send-email-peter@korsgaard.com>
Message-ID: <87zis4n94t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > u-boot-dtb.img only gets built by default (all target) if
 > CONFIG_OF_SEPARATE _AND_ CONFIG_SPL_FRAMEWORK are enabled.

 > Certain SoCs (E.G. Action Semi S500) use a proprietary first level
 > bootloader instead of u-boot SPL, but still use u-boot-dtb.img as the first
 > level bootloader parses the uImage header for size/loadaddr.

 > Ensure u-boot-dtb.img gets built if enabled by explicitly listing it as a
 > u-boot make target (next to all) to support such setups.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
