From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 19 Nov 2008 13:23:46 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
	<e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
Message-ID: <e4c675870811190423l69e348f3p187d6b9d13d3034@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> Hi,
>
>  I do not think libpng12-config could be useful in the target system
> if it does not a developing system itself
>
> --- package/libpng/libpng.mk    (revision 24038)
> +++ package/libpng/libpng.mk    (working copy)
> @@ -28,5 +28,8 @@
>                -e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng12\',g" \
>                -e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
>                $(STAGING_DIR)/usr/bin/libpng12-config
> +ifneq ($(strip $(CONFIG_BR2_HAVE_DEVFILES)),y)
> +       rm -f $(TARGET_DIR)/usr/bin/libpng12-config
> +endif
>        touch $@
>

 patch attached

-- 
/roberto
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libpng.patch
Type: text/x-diff
Size: 495 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081119/a345c98c/attachment.patch 
