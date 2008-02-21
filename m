From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 21 Feb 2008 16:20:15 +1100
Subject: [Buildroot] patch to allow selection of e2fsprogs
	tools	toinstall
In-Reply-To: <007501c87443$5565b9a0$040514ac@atmel.com>
References: <20080220061811.GA8033@cloud.net.au>
	<007d01c8738a$903f7ca0$f4031a0a@atmel.com>
	<20080221013827.GA27859@cloud.net.au>
	<007501c87443$5565b9a0$040514ac@atmel.com>
Message-ID: <20080221052015.GA31271@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 21, 2008 at 05:36:25AM +0100, Ulf Samuelsson wrote:
> That doesn't work so I assume it was never tested.
> Pls test before you resubmit.

I did, and it works for me.

> $(E2FSPROGS_RM) is always clear
> $(E2FSPROGS_RM-y) and $(E2FSPROGS_RM-n) may have contents.

No,

> > +E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BADBLOCKS)) += ${TARGET_DIR}/sbin/badblocks
> > +E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BLKID)) += ${TARGET_DIR}/sbin/blkid

$(E2FSPROGS_RM-*) is not used, it is $(E2FSPROGS_RM)y and
$(E2FSPROGS_RM). I could have used RM-, but I thought $(E2FSPROGS_RM-)
looked odd.

Hence,

> > +ifneq ($(strip $(E2FSPROGS_RM)),)
> > + rm -rf $(E2FSPROGS_RM)
> > +endif


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
