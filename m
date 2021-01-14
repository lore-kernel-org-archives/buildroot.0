From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 14 Jan 2021 14:54:22 +0100
Subject: [Buildroot] Support for BCM953012HR board?
In-Reply-To: <1610587332564-0.post@n4.nabble.com>
References: <1610587332564-0.post@n4.nabble.com>
Message-ID: <CACna6rzFC7jbmSasCMfRPsCaqjmHgDexBL8VvvCx_Mq7TPjaqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 14 Jan 2021 at 02:22, scdrj <scdrjcom@gmail.com> wrote:
> How do I build the images for BCM953012HR (Broadcom Northstar Reference
> board)?

I took care of adding upstream Linux support for a few Northstar hw
components. Current support is quite complete except for:
1. Hardware NAT acceleration
2. Broadcom SoftMAC wireless chipsets

I planned to add buildroot support for Northstar boards but it takes
many months to get my patches reviewed.

My initial WiFi firmware patch was accepted after 5 months:
[PATCH] package/linux-firmware: add options for Broadcom BCM4366
Currently I'm waiting for lzma-alone decision:
[PATCH] package/lzma-alone: new package

Once I get lzma-alone somehow merged I'm planning to add Northstar
boards support.

Until that you can check OpenWrt project. It has target called
"bcm53xx" that handles Northstar devices. There are only few
downstream patches needed to get those devices running:
https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/bcm53xx/patches-5.4;hb=HEAD

-- 
Rafa?
