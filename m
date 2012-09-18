From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 18 Sep 2012 18:48:47 +0300
Subject: [Buildroot] [PATCH 6/9] firefox: Mozilla Web Browser
In-Reply-To: <5057A4D4.60904@mind.be>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-7-git-send-email-stefan.froberg@petroprogram.com>
 <5057A4D4.60904@mind.be>
Message-ID: <505897DF.9070102@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout

18.9.2012 1:31, Arnout Vandecappelle kirjoitti:
> On 09/05/12 16:29, Stefan Fr?berg wrote:
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>
>  First a general remark: it would be better to split this patch up in
> smaller
> chunks.  It took me a week to review it (not full-time, of course), and
> iterations on the patch will again take a lot of time to review.  By
> splitting them up, individual patches can be acked and don't need to
> be looked at again.
>
>  The first patch should add a minimal firefox, without any additional
> config options.  It should just work with both glibc-based and uclibc-
> based toolchains.
>
>  Next patches should add a feature/extension, one at a time.
> Probably starting with debug and webm, and continuing with extensions
> that download XPIs.
>
>
>  Another overall remark: I think it's better to make separate packages
> for the extensions, langpacks, etc. (xpis, in short).  The firefox.mk
> can define some generic infrastructure which can be used by the extension
> packages.  The extension's .mk would be something like:
>
> FIREFOX_LANGPACK_XX_SITE = $(FIREFOX_LANGPACK_SITE)
> FIREFOX_LANGPACK_XX_SOURCE = xx.xpi
>
> FIREFOX_LANGPACK_XX_EXTRACT_CMDS =
>
> define FIREFOX_LANGPACK_XX_INSTALL_TARGET_CMDS
>     install -D -m 0644 $(DL_DIR)/$($(PKG)_SOURCE)
> $(FIREFOX_EXTENSIONS_DIR)/langpack-xx.xpi
> endef
>
> $(eval $(generic-package))
>
>  Could be even simpler with a $(firefox-package) wrapper.   
>
>  Admittedly, this step is non-trivial, so I'm OK with leaving the
> extensions
> part of the firefox package for the time being.
>
>
>
>  I build-tested on a few platforms.  On an ARM with Linaro-hardfloat
> toolchain,
> some assembly function failed in nspr - but libnspr fails as well with
> that
> toolchain.  On a MIPS, I needed the patch from
> https://bugzilla.mozilla.org/show_bug.cgi?id=691898
> to avoid compiling pcre.  But in the end, the compilation with a glibc
> toolchain
> still failed because of the -D_FILE_OFFSET_BITS=64 from LARGEFILE.
> This requires
> -U_FILE_OFFSET_BITS to be added to CFLAGS/CXXFLAGS.
>
>  In the end, I didn't get it to compile on either the ARM or the MIPS
> config, so
> I gave up...  But there's already plenty of material below to keep you
> busy
> for a while :-)
>
>
Oh my god.
I bet it will take me several weeks (or maybe even month or more) to fix
all these things ...
And because I don't have any other machines than x86  I can't test with
ARM or MIPS
> [snip]
>
>
>  Phew, glad I managed to finish this review :-)
>
>  Regards,
>  Arnout

Thank you so much! You have done a wonderful job!
I really really really appreciate it.

**Best regards
Stefan


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120918/7daa1c82/attachment-0001.html>
