From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 12:54:14 +0200
Subject: [Buildroot] [PATCH v2 1/6] libtirpc: add host package
In-Reply-To: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
Message-ID: <20180522125414.1764d946@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 May 2018 13:30:12 +0300, Baruch Siach wrote:
> The libtirpc host package is only for two headers that the host rpcgen
> utility from the nfs-utils package needs to build. glibc used to provide
> these headers. In version 2.26 glibc deprecated them with its bundled
> Sun RPC. Recently Fedora stopped enabling Sun RPC in glibc. So we can no
> longer rely on these headers being present on the host.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks for this new iteration. Did you test this on Fedora 28 ?

Because when I tried your first iteration, I did install rpc/types.h by
hand, but then the build failed again because another rpc/ header was
missing, and this is where I gave up.

I'll try to test your patch series on Fedora 28, but I'm a bit short on
time today for this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
