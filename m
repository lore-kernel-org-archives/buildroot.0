From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:53:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: Fix compilation when
 __uClinux__ is defined
In-Reply-To: <D26F367F-EE90-4A2D-8603-7EBE04E9E2BD@gmail.com>
References: <1469954504-31016-1-git-send-email-bernd.kuhls@t-online.de>
 <D26F367F-EE90-4A2D-8603-7EBE04E9E2BD@gmail.com>
Message-ID: <20160804225318.34de32a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Aug 2016 23:53:57 -0700, Khem Raj wrote:

> better to use
> 
> if defined(__uClinux__) && defined(CHIP_DM642)

Possibly, but where would lddk.h come from? I don't see it in the
uClibc-ng sources, and I don't see it in the kernel either. So I don't
quite see this header could end up in a toolchain.

> may be if someone is using BR for ti_c6x

A platform for which we don't have support today.

I'm all for making proper upstreamable patches, but in this specific
case, I'm not even sure where lddk.h is supposed to come from.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
