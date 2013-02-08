From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Feb 2013 22:01:34 +0100
Subject: [Buildroot] [PATCH v3 2/6] docs/manual: mention the new
	post-image mechanism
In-Reply-To: <1360274328-14754-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Feb 2013 22:58:44 +0100")
References: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360274328-14754-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v6yh64x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Thomas> ---
 v1-> v2:
 Thomas>  * Fix typos noticed by Yann.
 v2-> v3:
 Thomas>  * Mention that the post-image scripts are executed as the user
 Thomas>    executing Buildroot, i.e generally not the root user. Suggested by
 Thomas>    Samuel Martin.
 Thomas> ---
 Thomas>  docs/manual/customize-rootfs.txt |   22 ++++++++++++++++++++++
 Thomas>  1 file changed, 22 insertions(+)

 Thomas> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
 Thomas> index fa04d85..97af580 100644
 Thomas> --- a/docs/manual/customize-rootfs.txt
 Thomas> +++ b/docs/manual/customize-rootfs.txt
 Thomas> @@ -55,3 +55,25 @@ there are a few ways to customize the resulting target filesystem.
 Thomas>    target root filesystem in +package/customize/source+, and then
 Thomas>    enable this special package in the configuration system. _This
 Thomas>    method is marked as deprecated_.
 Thomas> +
 Thomas> +Note also that if you want to perform some specific actions *after*
 Thomas> +all filesystem images have been created (for example to automatically
 Thomas> +extract your root filesystem tarball in a location exported by your
 Thomas> +NFS server, or to create a special firmware image that bundles your
 Thomas> +root filesystem and kernel image, or any other custom action), you can
 Thomas> +specify a space-separated list of scripts in the
 Thomas> ++BR2_ROOTFS_POST_IMAGE_SCRIPT+ configuration option.
 Thomas> +
 Thomas> +Each of those scripts will be called, with the path to the +images+

I don't think this comma should be here.

 Thomas> +output directory as first and unique argument, and will be executed
 Thomas> +with the main Buildroot source directory as the current
 Thomas> +directory. Those scripts will be executed as the user that executes
 Thomas> +Buildroot, which should normally not be the root user. Therefore, any
 Thomas> +action requiring root permissions in one of these post-image script
 Thomas> +will require special handling (usage of fakeroot or sudo), which is
 Thomas> +left to the script developer.
 Thomas> +
 Thomas> +Just like for the _post-build scripts_ mentionned above, you also have

s/mentionned/mentioned/

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
