From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Nov 2014 17:00:59 +0000
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
In-Reply-To: <1416587791-30125-1-git-send-email-jaap@jcz.nl>
References: <1416587791-30125-1-git-send-email-jaap@jcz.nl>
Message-ID: <546F6FCB.1090101@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jaap Crezee,

On 11/21/2014 04:36 PM, Jaap Crezee wrote:
> ---
>  package/bluez5_utils/bluez5_utils.hash | 3 +++
>  package/bluez5_utils/bluez5_utils.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/bluez5_utils/bluez5_utils.hash
> 
> diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
> new file mode 100644
> index 0000000..9166f7e
> --- /dev/null
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -0,0 +1,3 @@
> +# No upstream hashes for the following:
> +sha1    8f65a7076d83116cfacbb84374b99269cd15f1d6                            bluez-5.25.tar.xz
> +sha256  5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30    bluez-5.25.tar.xz
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index f34513c..21f792c 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BLUEZ5_UTILS_VERSION = 5.21
> +BLUEZ5_UTILS_VERSION = 5.25
>  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_INSTALL_STAGING = YES
> 

thanks for sending an improved version of your patch. Is much better now :)

Here you have my:

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Just a few more things for the next time you send patches to Buildroot.
After sending a new version of a patch, we usually mark the former patch
as "superseded" in patchwork. To be able to do that, you need to be
logged in in patchwork. If you don't have an account, you can create one
here:

http://patchwork.ozlabs.org/register/

Another one. When you create the patch using "git format-patch", before
sending it, please edit the patch using your favourite text editor and
add the version number in the "Subject" line. Here is an example using
your own patch:

Subject: [PATCH v2] bluez5_utils: bumped version number to 5.25

Also, is useful if you explain the differences between the patch
versions. You can add that information just below the "---" line of you
patch. Here is an example using your own patch:

# [snip] #
Subject: [PATCH] bluez5_utils: bumped version number to 5.25

---
Changes v1 -> v2:
- Improved subject
- Add a hash file

 package/bluez5_utils/bluez5_utils.hash |    3 +++
# [snip] #

And the last thing. Having only the sha256 hash is enough. And, if there
are no upstream hashes we can use, then we usually say "Locally
calculated" as a comment, instead of saying that there are no upstream
hashes, as you did.

I hope my comments help you in the future.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
