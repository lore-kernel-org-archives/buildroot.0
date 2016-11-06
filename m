From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 6 Nov 2016 18:59:48 +0100
Subject: [Buildroot] [PATCH v3 24/24] toolchain-external: introduce and
 use external toolchain infra
In-Reply-To: <be5404f4-1bca-c263-17b9-25039475d157@mind.be>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
 <1477925833-27204-25-git-send-email-romain.naour@gmail.com>
 <be5404f4-1bca-c263-17b9-25039475d157@mind.be>
Message-ID: <2ad1c66b-b333-ad48-e47d-258472525ac5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 06/11/2016 ? 18:50, Arnout Vandecappelle a ?crit :
> 
> 
> On 31-10-16 15:57, Romain Naour wrote:
>> -# Some toolchain vendors have a regular file naming pattern.
>> -# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.
>> -ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
>> -TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
>> -	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
>> -endif
> 
>  I didn't notice earlier, but this bit seems to have gotten lost. Forgot to test
> legal-info?

no, because each codosourcery package provide their own
TOOLCHAIN_EXTERNAL_CODESOURCERY_<arch>_ACTUAL_SOURCE_TARBALL, so legal-info
should still works.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
