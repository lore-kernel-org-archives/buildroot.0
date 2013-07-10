From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 09:31:34 +0200
Subject: [Buildroot] [PATCH] system: add option to pass extra args to
	post-build and post-image scripts
In-Reply-To: <1373407231-20382-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 10 Jul 2013 00:00:31 +0200")
References: <1373407231-20382-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87bo6ahnvt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> It can be useful to have different configuration use the same post-build
 Yann> and/or post-image scripts as they share a common infrastructure, but yet
 Yann> have minor differentiation.

 Yann> This option allows passing zero or more additional arguments to each
 Yann> post-build or post-image script.

 Yann> The same set of extra arguments are passed to all scripts, it is not
 Yann> possible to pass different arguments to each script.

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Baruch Siach <baruch@tkos.co.il>

 Yann> ---
 Yann> Changes v1 -> v2:
 Yann>   - $(TARGET_DIR) is no longer the only argument        (Baruch)
 Yann>   - mention BR2_ROOTFS_POST_IMAGE_SCRIPT in the manual

 Yann> +config BR2_ROOTFS_POST_SCRIPT_ARGS
 Yann> +	string "Extra post-{build,image} arguments"
 Yann> +	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" || BR2_ROOTFS_POST_IMAGE_SCRIPT != ""

 Yann> +	help
 Yann> +	  Pass these aditional arguments to each post-build or post-image
 Yann> +	  scripts.
 Yann> +
 Yann> +	  Note that all the post-build and post-image scripts will be passed
 Yann> +	  the same set of arguments, you can not pass different arguments to
 Yann> +	  each script.
 Yann> +
 Yann> +	  Note also, as stated in their respective help text, that the first
 Yann> +	  argument to each post-build or post-image script is the target/
 Yann> +	  directory $(TARGET_DIR). The arguments in this option will be
 Yann> +	  passed *after*.

The post-image script is called with the images directory, not the
target directory.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
