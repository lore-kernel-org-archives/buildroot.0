From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 7 Nov 2013 11:54:47 +0100
Subject: [Buildroot] [PATCH 4 of 4 v2] manual: add some info on the
 POST_RSYNC hook
In-Reply-To: <5373a0083b692806e5b6.1383820884@argentina>
References: <patchbomb.1383820880@argentina>
 <5373a0083b692806e5b6.1383820884@argentina>
Message-ID: <CAHXCMMJKhah7joiqbNeKCmTFSujvhXxS3NRAfUX2=+px+OK2gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/7 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>


>
> ---
> v2: rsync is also used for site method 'local' (comment ThomasP on IRC)
>
>  docs/manual/adding-packages-hooks.txt |  20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>
> diff --git a/docs/manual/adding-packages-hooks.txt
> b/docs/manual/adding-packages-hooks.txt
> --- a/docs/manual/adding-packages-hooks.txt
> +++ b/docs/manual/adding-packages-hooks.txt
> @@ -39,3 +39,23 @@ endef
>
>  LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
>  ----------------------
> +
> +Using the +POST_RSYNC+ hook
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +The +POST_RSYNC+ hook is run only for packages that use a local source,
> +either through the +local+ site method or the +OVERRIDE_SRCDIR+
> +mechanism. In this case, package sources are copied using +rsync+ from
> +the local location into the buildroot build directory. The +rsync+
> +command does not copy all files from the source directory, though.
> +Files belonging to a version control system, like the directories
> ++.git+, +.hg+, etc. are not copied. For most packages this is
> +sufficient, but a given package can perform additional actions using
> +the +POST_RSYNC+ hook.
> +
> +In principle, the hook can contain any command you want. One specific
> +use case, though, is the intentional copying of the version control
> +directory using +rsync+. The +rsync+ command you use in the hook can,
> among
> +others, use the following variables:
> +
> +* +$(SRCDIR)+: the path to the overridden source directory
> +* +$(@D)+: the path to the build directory
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131107/ed00a074/attachment.html>
