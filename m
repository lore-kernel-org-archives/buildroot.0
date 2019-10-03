From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 3 Oct 2019 15:14:21 -0300
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix nfs-utils_env.sh
 path
In-Reply-To: <20191003140410.45651-1-james.hilliard1@gmail.com>
References: <20191003140410.45651-1-james.hilliard1@gmail.com>
Message-ID: <CAJ4jsacGBbS1eU8n+Yzgy1e0=hm6jPLKXuYxHK5cCzLaP2QHTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 3, 2019 at 11:04 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Per upstream commit bf12e1fa9f48e8ee91a2869e69484c70595b5160
> https://cdn.kernel.org/pub/linux/utils/nfs-utils/1.3.4/1.3.4-Changelog
>
> Currently nfs-utils_env.sh is installed in a
> directory that is own by systemd. They requested
> via https://bugzilla.redhat.com/show_bug.cgi?id=1303113
> to move the script into /usr/libexec/nfs-utils
>
> As such we must update the installation path for nfs-utils_env.sh.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/nfs-utils/nfs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 9d3e5e7563..cb2caa03f0 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -93,7 +93,7 @@ define NFS_UTILS_INSTALL_INIT_SYSTEMD
>                 $(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants/nfs-client.target
>
>         $(INSTALL) -D -m 0755 package/nfs-utils/nfs-utils_env.sh \
> -               $(TARGET_DIR)/usr/lib/systemd/scripts/nfs-utils_env.sh
> +               $(TARGET_DIR)/usr/libexec/nfs-utils/nfs-utils_env.sh
>
>         $(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
>                 $(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Tested-by: Carlos Santos <unixmania@gmail.com>
