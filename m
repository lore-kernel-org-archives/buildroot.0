From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 23:13:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: use tirpc when no
 toolchain RPC
In-Reply-To: <1564043421-126710-1-git-send-email-simon.rowe@citrix.com>
References: <1564043421-126710-1-git-send-email-simon.rowe@citrix.com>
Message-ID: <20190726231303.372c0130@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

On Thu, 25 Jul 2019 09:30:21 +0100
Simon Rowe <simon.rowe@citrix.com> wrote:

> openvmtools detects an external RPC library, select package/libtirpc
> when necessary.
> 
> Signed-off-by: Simon Rowe <simon.rowe@citrix.com>

Thanks for the patch. However, adding the select in Config.in was not
sufficient: it does not guarantee that libtirpc will be built before
openvmtools. To ensure it gets built before, libtirpc needs to be added
to OPENVMTOOLS_DEPENDENCIES.

So I fixed this issue in your patch, slightly tweaked the commit
title/log and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
