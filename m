From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 14:39:01 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: Fix build for 2.1.1
In-Reply-To: <20170306104327.GC24367@airbook.vandijck-laurijssen.be>
References: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
 <20170306091911.05fb09c2@free-electrons.com>
 <20170306104327.GC24367@airbook.vandijck-laurijssen.be>
Message-ID: <20170306143901.0cb1e1f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Mar 2017 11:43:27 +0100, Kurt Van Dijck wrote:
> This patch repairs the build for libwebsockets 2.1.1
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Thanks for this patch.

> --
> diff --git a/package/libwebsockets/lws211-lib-libwebsockets-format.patch b/package/libwebsockets/lws211-lib-libwebsockets-format.patch
> new file mode 100644
> index 0000000..a563048
> --- /dev/null
> +++ b/package/libwebsockets/lws211-lib-libwebsockets-format.patch

However, we require all patches to have a description + Signed-off-by
line. Could you add one?

But in fact, this issue has already been fixed upstream, by commit
https://github.com/warmcat/libwebsockets/commit/f9f5a5760782b68fba190fb46d306f7c08f027c0.

So you could instead do:

LIBWEBSOCKETS_PATCH = https://github.com/warmcat/libwebsockets/commit/f9f5a5760782b68fba190fb46d306f7c08f027c0.patch

(and add an entry in the .hash file) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
