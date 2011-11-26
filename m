From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Nov 2011 13:56:24 +0100
Subject: [Buildroot] [PATCH] php: fix build breakage
In-Reply-To: <1322236144-2570-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 25 Nov 2011 12:49:04 -0300")
References: <1322236144-2570-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nxrjb47.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The zip extension requires zlib, so select it.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/php/Config.ext |    2 ++
 Gustavo>  1 files changed, 2 insertions(+), 0 deletions(-)

 Gustavo> diff --git a/package/php/Config.ext b/package/php/Config.ext
 Gustavo> index 4f1614e..6df8cc3 100644
 Gustavo> --- a/package/php/Config.ext
 Gustavo> +++ b/package/php/Config.ext
 Gustavo> @@ -125,6 +125,8 @@ config BR2_PACKAGE_PHP_EXT_SYSVSHM
 
 Gustavo>  config BR2_PACKAGE_PHP_EXT_ZIP
 Gustavo>  	bool "zip"
 Gustavo> +	select BR2_PACKAGE_PHP_EXT_ZLIB
 Gustavo> +	select BR2_PACKAGE_ZLIB

Thanks, but selecting the zlib extension doesn't seem completely right
(not a big deal, but still), so I've changed it to only select zlib +
add the --with-zlib / add zlib to deps in the .mk instead.

-- 
Bye, Peter Korsgaard
