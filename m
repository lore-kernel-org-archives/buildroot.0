From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 23:50:40 +0200
Subject: [Buildroot] [PATCH 10/10] libssl: add libressl as a option
In-Reply-To: <20170804185521.12320-11-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-11-Adamduskett@outlook.com>
Message-ID: <37bd4a78-df9d-c588-6963-50b8b58a6d37@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 20:55, Adam Duskett wrote:
[snip]
>  LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
>  endif
>  
> +$(eval $(host-autotools-package))
>  $(eval $(autotools-package))

 Ah, here is the host package!

 This should be a separate patch (the one you had before). There is still one
problem, though: there is nothing stopping both host-openssl and host-libressl
to be built. Oh, hang on, that's not true, because you never depend on
host-openssl or host-libressl but always on host-libssl. OK, that sounds like a
good solution then! Can you extend the commit message with a sentence that
explains this?

 Note, I've marked the entire series as changes requested in patchwork, except
for the version bumps that can be applied independently.

 Regards,
 Arnout

> diff --git a/package/libssl/Config.in b/package/libssl/Config.in
> index 5f3d2fc2a..7a1ca68d4 100644
> --- a/package/libssl/Config.in
> +++ b/package/libssl/Config.in
> @@ -12,6 +12,7 @@ choice
>  	  Select OpenSSL or LibreSSL.
>  
>  	source "package/openssl/Config.in"
> +	source "package/libressl/Config.in"
>  
>  endchoice
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
