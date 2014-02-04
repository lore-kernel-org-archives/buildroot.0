From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 10:27:14 +0100
Subject: [Buildroot] [PATCH v3 2/2] gummiboot: new package
In-Reply-To: <1391280837-1928-2-git-send-email-cvubrugier@yahoo.fr>
References: <1391280837-1928-1-git-send-email-cvubrugier@yahoo.fr>
 <1391280837-1928-2-git-send-email-cvubrugier@yahoo.fr>
Message-ID: <52F0B272.8020701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/02/14 19:53, Christophe Vu-Brugier wrote:
[snip]
> +config BR2_TARGET_GUMMIBOOT_I386
> +	bool "i386"
> +	select BR2_PACKAGE_GNU_EFI_IA32
> +	# We unfortunately can't easily build gummiboot 32 bits when
> +	# the selected target architecture is x86-64
> +	depends on BR2_i386
> +
> +comment "32 bits gummiboot is only available for i386"
> +	depends on BR2_x86_64
> +
> +config BR2_TARGET_GUMMIBOOT_X86_64
> +	bool "x86-64"
> +	select BR2_PACKAGE_GNU_EFI_X64
> +	depends on BR2_x86_64
> +
> +endchoice

 This choice always has only one option, so why does it exist?


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
