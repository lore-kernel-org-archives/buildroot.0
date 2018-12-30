From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:42:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/lua-curl: Fix define for
 lcurl_mime_t for curl 7.56.0
In-Reply-To: <20181225013125.31787-1-vadim4j@gmail.com>
References: <20181225013125.31787-1-vadim4j@gmail.com>
Message-ID: <20181230174211.2cae3421@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Dec 2018 03:31:25 +0200, Vadim Kochan wrote:
> Remove ';' at the end of #define for lcurl_mime_t, which looks like a
> typo.
> 
> It fixes failing of lua-curl for build results:
> http://autobuild.buildroot.net/results/f3c0c1aa8f860fddc1312823530ab369b198820c/config
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  ...x-define-for-lcurl_mime_t-for-curl-7.56.0.patch | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/lua-curl/0002-lceasy.h-Fix-define-for-lcurl_mime_t-for-curl-7.56.0.patch

Thanks, I've applied, but after replacing your patch by a backport of
the exact same patch from upstream. Also, upstream has a newer 0.3.9
version available, which has this fix included.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
