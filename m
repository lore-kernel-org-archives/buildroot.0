From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 4 Apr 2016 12:02:07 +0200
Subject: [Buildroot] [PATCH 1/2] qt5connectivity: add sdpscanner tool
	for Qt5Bluetooth
In-Reply-To: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
References: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <CAGm1_ktt4d7ELbUUuEyPX6qiEvXbBdOGhkiC4+yu_s3K6VP4kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien, all,

On Mon, Apr 4, 2016 at 11:56 AM, Julien Corjon <corjon.j@ecagroup.com> wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5connectivity/qt5connectivity.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
> index a68f5ec..936bc6f 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.mk
> +++ b/package/qt5/qt5connectivity/qt5connectivity.mk
> @@ -43,6 +43,7 @@ endif
>
>  define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
>         cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
> +       cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin

would $(INSTALL) be preferable here? Do we have any rules?

Yegor

>         $(QT5CONNECTIVITY_INSTALL_TARGET_QMLS)
>  endef
>
> --
> 2.5.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
