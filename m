From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 15:32:48 +0200
Subject: [Buildroot] [PATCH v3] systemd: allow to build with uClibc
 toolchains
In-Reply-To: <20170808163702.GA29748@waldemar-brodkorb.de>
References: <20170808163702.GA29748@waldemar-brodkorb.de>
Message-ID: <a4dba163-8e8a-9168-ac8c-cab8ba1333ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Waldemar,

 If you're willing to go through another round, I have a few remarks...

On 08-08-17 18:37, Waldemar Brodkorb wrote:
[snip]
>  config BR2_PACKAGE_SYSTEMD_MACHINED
>  	bool "enable machine daemon"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC

 Could you add a comment why this doesn't work on uClibc?

 Normally for packages that have a library dependency we add a comment line. I'm
not sure if we really want that here, though, it's making things a little heavy
maybe. Although, in the menu it would look pretty OK I think. What do you think?

 Both comments repeated for the rest of this file.

[snip]
> @@ -138,7 +138,7 @@ config BR2_INIT_SYSTEMD
>  	select BR2_PACKAGE_SYSTEMD
>  
>  comment "systemd needs a glibc toolchain, headers >= 3.10"
                            ^^^^^ or uClibc? :-)

> -	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC \

 Maybe add parenthesis here for clarity - I'm not sure what the binding is of ||
and && in kconfig...

 Regards,
 Arnout

>  		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
>  
>  config BR2_INIT_NONE
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
