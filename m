From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 23:02:36 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <20150923230236.5b5c5302@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Wetzel,

On Wed, 23 Sep 2015 15:16:34 +0200, Andreas Wetzel wrote:
> Added configuration option BR2_PACKAGE_LIBWEBSOCKETS_IPV6 that
> adds -DLWS_IPV6=ON/OFF to LIBWEBSOCKETS_CONF_OPTS.
> 
> Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>

We stopped supporting IPv6 as an optional feature in the toolchain, and
made it mandatory. So, to go in the same direction, I would suggest to
simply always enable IPv6 in libwebsockets.

What is the size overhead of enabling IPv6 ? If it's reasonable, then
we want IPv6 to be unconditionally enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
