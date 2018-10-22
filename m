From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 23:43:16 +0100
Subject: [Buildroot] Linux driver load failure with BR 2018.05
In-Reply-To: <AM4PR0802MB2210297D6D99BC3630A51C1BEAF40@AM4PR0802MB2210.eurprd08.prod.outlook.com>
References: <AM4PR0802MB2210297D6D99BC3630A51C1BEAF40@AM4PR0802MB2210.eurprd08.prod.outlook.com>
Message-ID: <37a2f9c4-c5f0-ca4e-b168-48a1e22b9cbd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/22/18 2:46 PM, Fabrice Mousset | GEOCEPT GmbH wrote:
> Linux boots on device but I?ve got strange errors for some modules (which are
> part of Linux source code):
> 
> [??? 7.637965] bcmdhd: disagrees about version of symbol alloc_etherdev_mqs

 This is an indication that you built the bcmdhd module with a different
configuration (or maybe even different kernel version) than whatever module (or
core kernel) is providing alloc_etherdev_mqs. When you do a proper kernel build,
it shouldn't happen though. So it looks like you didn't properly install
everything to your target (e.g. you updated the modules but not the kernel).

> 
> [??? 7.644774] bcmdhd: Unknown symbol alloc_etherdev_mqs (err -22)

 It can't find the symbol with the version it requires.

 Regards,
 Arnout

[snip]
