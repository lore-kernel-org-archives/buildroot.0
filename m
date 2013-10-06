From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 21:31:46 +0200
Subject: [Buildroot] [PATCHv2 04/21] toolchain: move helpers.mk into
	toolchain-external/
In-Reply-To: <1381069171-29748-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Oct 2013 16:19:14 +0200")
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381069171-29748-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9imdwm5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The helpers.mk file is no longer used by the Crosstool-NG backend, so
 Thomas> it is moved into the toolchain/toolchain-external/ directory.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  toolchain/toolchain-buildroot.mk              | 2 --
 Thomas>  toolchain/toolchain-external.mk               | 2 +-
 Thomas>  toolchain/{ => toolchain-external}/helpers.mk | 0
 Thomas>  3 files changed, 1 insertion(+), 3 deletions(-)
 Thomas>  rename toolchain/{ => toolchain-external}/helpers.mk (100%)

 Thomas> diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
 Thomas> index 3a05800..ff89125 100644
 Thomas> --- a/toolchain/toolchain-buildroot.mk
 Thomas> +++ b/toolchain/toolchain-buildroot.mk
 Thomas> @@ -2,8 +2,6 @@
 Thomas>  # build of binutils, uClibc, kernel headers and all the intermediate
 Thomas>  # gcc steps.
 
 Thomas> -include toolchain/helpers.mk
 Thomas> -

That doesn't seem right as we have:

git grep copy_toolchain package/
package/glibc/glibc.mk:         $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,

And indeed:

>>> glibc 2.17-svnr22064 Installing to target
for libs in ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so libnss_files.so libnss_dns.so; do  ; done
/bin/sh: -c: line 0: syntax error near unexpected token `;'
/bin/sh: -c: line 0: `for libs in ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so libnss_files.so libnss_dns.so; do  ; done'
make: *** [/home/peko/source/buildroot/output/build/glibc-2.17-svnr22064/.stamp_target_installed] Error 1

-- 
Bye, Peter Korsgaard
