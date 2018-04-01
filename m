From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 22:37:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] efivar: update to version 34 to pick
 up gcc7 compile fixes
In-Reply-To: <20180301235756.95597-1-charles.hardin@storagecraft.com> (charles
 hardin's message of "Thu, 1 Mar 2018 15:57:56 -0800")
References: <20180301235756.95597-1-charles.hardin@storagecraft.com>
Message-ID: <87k1tqpssl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <charles.hardin@storagecraft.com> writes:

 > From: Charles Hardin <charles.hardin@storagecraft.com>
 > Instead of patching the prior version of efivar, just update to
 > a current version 34 to fix some gcc7 compile errors like the
 > following:

 > dp-media.c: In function '_format_media_dn':
 > dp.h:121:12: error: argument 1 value '18446744073709551610'
 >              exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
 >    uint16_t _ucs2buf[(len)];    \

 > Removed patches that are upstreamed:
 > 0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
 > 0003-Remove-some-extra-const-that-gcc-complains-about.patch

 > Changed the EFIVAR_SITE in efivar.mk:
 > Pointed to the rhboot/efivar site on github since that appears
 > to be where this project is hosted now.

 > Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>

Sorry, I missed your patch and have in the mean time applied a more
complete variant, so I'm marking this as superseeded:

https://git.buildroot.net/buildroot/commit/?id=bb7a698001302249abf57762a0483fa2c3edb50a

-- 
Bye, Peter Korsgaard
