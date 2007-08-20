From: Thomas Lundquist <lists@zelow.no>
Date: Mon, 20 Aug 2007 14:36:23 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	package/lzmatarget/linux toolchain/kern etc...
In-Reply-To: <016201c7e0d8$5415c8a0$dcc4af0a@atmel.com>
References: <20070816181741.AD51FA5E18@busybox.net>
	<20070817112226.GD29258@zelow.no>
	<016201c7e0d8$5415c8a0$dcc4af0a@atmel.com>
Message-ID: <20070820123623.GB688@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 17, 2007 at 03:23:06PM +0200, Ulf Samuelsson wrote:
> 
> It *will* always be put in "STAGING_DIR/usr/bin".
> The new configuration item allows you to put it in /usr/local/bin as well, an extra feature.
> STAGING_DIR/usr/bin/lzma will still be available.
> 
> Buildroot won't find "STAGING_DIR/usr/bin/lzma" so you have to do
> PATH:=$(STAGING_DIR)/usr/bin:$(PATH) outside buildroot.

why? applying a PATH inside the build isn't any big issue. We are
already doing it in many places if I recall.

> make LZMA=$(STAGING_DIR)/usr/bin/lzma -C $(LINUX26_DIR)

maybe.


Thomas.
