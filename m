From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 10:03:05 +0200
Subject: [Buildroot] [PATCH v2] package/nfs-utils: enable IPv6
In-Reply-To: <20190812173712.23202-1-unixmania@gmail.com>
References: <20190812173712.23202-1-unixmania@gmail.com>
Message-ID: <20190909100305.6ed6662d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Arnout, Peter added in Cc, see below.

On Mon, 12 Aug 2019 14:37:12 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> IPv6 requires libtirpc, so select BR2_PACKAGE_LIBTIRPC inconditionally.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Arnout, Peter, do you have an opinion about this change ?

Basically, this change makes libtirpc mandatory for nfs-utils, because
it is necessary to have IPv6 RPC support.

However, libtirpc is always necessary if you want RPC on IPv6, so if we
take the decision of making libtirpc mandatory for nfs-utils, we should
make it mandatory for all packages that use RPC support, and remove the
support for RPC from the toolchain.

My opinion is that we should keep things are they are today: nfs-utils
uses libtirpc if it's there, and otherwise uses the toolchain RPC
support. If a user wants IPv6 support, he should enable libtirpc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
