From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 09:26:57 +0100
Subject: [Buildroot] [PATCH 1/4] package/tpm2-tss: bump to version 2.3.2
In-Reply-To: <20191214232602.3337220-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Dec 2019 00:25:59 +0100")
References: <20191214232602.3337220-1-fontaine.fabrice@gmail.com>
Message-ID: <87sglmdmem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Thanks, it was on my todo list for a while to bump the tpm2-* packages.

 > - Drop patch (already in version)
 > - Update hash of license file (SPDX ID has been removed with
 >   https://github.com/tpm2-software/tpm2-tss/commit/0dbc84ee45d0e4cd7eae528f53968f8877455aab)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > +++ b/package/tpm2-tss/tpm2-tss.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -TPM2_TSS_VERSION = 2.1.3
 > +TPM2_TSS_VERSION = 2.3.2
 >  TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 >  TPM2_TSS_LICENSE = BSD-2-Clause
 >  TPM2_TSS_LICENSE_FILES = LICENSE

The ax_cv_check_* environment variables we were setting to get rid the
hardcoded fstack-protector and _FORTIFY_SOURCE had changed upstream, but
while looking at that I see they have introduced a nicer way to get rid
of these hardcoded flags using --disable-defaultflags:

https://github.com/tpm2-software/tpm2-tss/commit/085755d44e5b953865eb4f2666063a7c773ea69d

So I reworked it to use that. This unfortunately also means that it
doesn't add -std=c99, so I had to manually do that to fix the build.

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
