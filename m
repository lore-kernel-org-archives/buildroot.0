From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 15:24:04 +0200
Subject: [Buildroot] [PATCHv3 10/20] toolchain: fix the helpers.mk
	comment
In-Reply-To: <1381256237-27948-11-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:07 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob6y37d7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit fixes various typos and mistakes in the comment at the top
 Thomas> of the helpers.mk file:

 Thomas>  * usefull -> useful

 Thomas>  * The optional stripping of libraries no longer exists, so there's no
 Thomas>    reason to mention it.

 Thomas>  * Indicate that the copy_toolchain_lib_root function is also used by
 Thomas>    the glibc package, not only by the external toolchain logic.

 Thomas>  * Separate more clearly the top comment introducing the entire file,
 Thomas>    from the comment introducing the first function.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  toolchain/helpers.mk | 12 +++++++-----
 Thomas>  1 file changed, 7 insertions(+), 5 deletions(-)

 Thomas> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
 Thomas> index 37f2cf9..d9051ae 100644
 Thomas> --- a/toolchain/helpers.mk
 Thomas> +++ b/toolchain/helpers.mk
 Thomas> @@ -1,9 +1,11 @@
 Thomas> -# This Makefile fragment declares helper functions, usefull to handle
 Thomas> +# This Makefile fragment declares helper functions, useful to handle
 Thomas>  # non- buildroot-built toolchains, eg. purely external toolchains.

This comment is still not quite true.

I've changed it to simply say:

This Makefile fragment declares toolchain related helper functions.

 Thomas> -#
 Thomas> -# Copy a toolchain library and its symbolic links from the sysroot
 Thomas> -# directory to the target directory. Also optionaly strips the
 Thomas> -# library.
 Thomas> +
 Thomas> +# The copy_toolchain_lib_root function copies a toolchain library and
 Thomas> +# its symbolic links from the sysroot directory to the target
 Thomas> +# directory. Note that this function is used both the external

s/both/by both/

-- 
Bye, Peter Korsgaard
