From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 16:11:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/gvfs: bump to version 1.44.1
In-Reply-To: <20200412125747.1073025-1-fontaine.fabrice@gmail.com>
References: <20200412125747.1073025-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714161113.6f48c925@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Apr 2020 14:57:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove all patches (already in version)
> - Move to meson-package
> - Add new gsettings-desktop-schemas mandatory dependency
> - gdu option doesn't exist anymore:
>   https://gitlab.gnome.org/GNOME/gvfs/-/commit/1db029df72bcd50dd877d388c2e0934d8ed3d321
> - Use new gcrypt otion
> - systemd-login option has been replaced by logind option
> - avahi option has been replaced by dnsd option
> - gtk3 optional dependency has been removed since
>   https://gitlab.gnome.org/GNOME/gvfs/-/commit/dff13283c943c8b10265bd3925d86f17cdc4be6f
> - Disable new sftp backend:
>   https://gitlab.gnome.org/GNOME/gvfs/-/commit/44d45dca5d1ab2369fa7e5c2789b31c51e44f985
> - Disable fuse (depends on fuse3 which is not available on buildroot)
> - Remove gvfs-less workaround (not installed anymore)
> - Update indentation of hash file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, I've applied, with just one change, see below.

> +GVFS_CONF_ENV = LIBS="$(TARGET_NLS_LIBS)"

I didn't actually test if this works or not, but none of our meson
packages add TARGET_NLS_LIBS this way. See:

$ git grep TARGET_NLS_LIBS $(git grep -l meson-package)

so I've changed to:

GVFS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

to match what we do in other packages.

Thanks!

Thomas
--  
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
