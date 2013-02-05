From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 14:54:04 +0100
Subject: [Buildroot] [PATCH] gnutls: tools require the package
In-Reply-To: <1360072194-22109-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 5 Feb 2013 10:49:54 -0300")
References: <1360072194-22109-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871ucuuarn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 >> From incomplete revert commit 68c3f5257d94d0fc0437747014f3c1ff4d02aa8b
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/gnutls/Config.in | 1 +
 Gustavo>  1 file changed, 1 insertion(+)

 Gustavo> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
 Gustavo> index 3a34c48..25cd552 100644
 Gustavo> --- a/package/gnutls/Config.in
 Gustavo> +++ b/package/gnutls/Config.in
 Gustavo> @@ -10,6 +10,7 @@ config BR2_PACKAGE_GNUTLS
 
 Gustavo>  config BR2_PACKAGE_GNUTLS_TOOLS
 Gustavo>  	bool "install tools"
 Gustavo> +	depends on BR2_PACKAGE_GNUTLS
 Gustavo>  	depends on BR2_USE_WCHAR

Ups, yes - But the BR2_USE_WCHAR should go (I removed the wrong
line). Committed with that fixed.

-- 
Bye, Peter Korsgaard
