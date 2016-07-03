From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 18:07:43 +0200
Subject: [Buildroot] [PATCH 2/4] package/libbluray: add support for
 libaacs
In-Reply-To: <1467487508-30061-2-git-send-email-bernd.kuhls@t-online.de>
References: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
 <1467487508-30061-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160703180743.047a9f44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 21:25:06 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libbluray/libbluray.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
> index dfe58f4..b81d759 100644
> --- a/package/libbluray/libbluray.mk
> +++ b/package/libbluray/libbluray.mk
> @@ -14,6 +14,11 @@ LIBBLURAY_DEPENDENCIES = host-pkgconf
>  
>  LIBBLURAY_CONF_OPTS = --enable-udf --disable-bdjava
>  
> +# libaacs is a run-time dependency loaded by dlopen

If it's a runtime dependency loaded by dlopen(), then there is no
reason to have it built *before* libbluray. So I've marked this patch
as Rejected. Let me know if you disagree, of course.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
