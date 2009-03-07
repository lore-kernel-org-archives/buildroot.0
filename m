From: Hiroshi Shinji <hiroshi.shinji@gmail.com>
Date: Sun, 8 Mar 2009 04:34:54 +0900
Subject: [Buildroot] svn commit: [25555]
	trunk/buildroot/package/logrotate
In-Reply-To: <20090305190018.85BAD76465@busybox.osuosl.org>
References: <20090305190018.85BAD76465@busybox.osuosl.org>
Message-ID: <d6a0e5a20903071134r76b57442j84dd87b627a3b4f7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> +       if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then
> +               $(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf;

You need to append backslashes to the end of these lines.

Regards,


2009/3/6  <jacmet@uclibc.org>:
> Author: jacmet
> Date: 2009-03-05 19:00:17 +0000 (Thu, 05 Mar 2009)
> New Revision: 25555
>
> Log:
> logrotate: only install logrotate.conf if not present in target_skeleton
>
> Allow platforms to provide a custom logrotate.conf in their target_skeleton.
>
> Modified:
>   trunk/buildroot/package/logrotate/logrotate.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/logrotate/logrotate.mk
> ===================================================================
> --- trunk/buildroot/package/logrotate/logrotate.mk      2009-03-05 19:00:11 UTC (rev 25554)
> +++ trunk/buildroot/package/logrotate/logrotate.mk      2009-03-05 19:00:17 UTC (rev 25555)
> @@ -18,7 +18,9 @@
>
>  $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY): $(LOGROTATE_DIR)/$(LOGROTATE_BINARY)
>        $(MAKE) PREFIX=$(TARGET_DIR) -C $(LOGROTATE_DIR) install
> -       $(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf
> +       if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then
> +               $(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf;
> +       fi
>        $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
>
>  logrotate: popt $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
?? ?
hiroshi.shinji at gmail.com
