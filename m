From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 19 Nov 2008 13:21:48 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
Message-ID: <e4c675870811190421r6612519ek47ef41d9f7434890@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> Hi
>
>  a) mkdir -p does not hurt but probably it is optional
>  b) s,cp -a,cp -af, because overwriting is necessary
>
> --- package/freetype/freetype.mk        (revision 24038)
> +++ package/freetype/freetype.mk        (working copy)
> @@ -15,7 +15,8 @@
>  $(eval $(call AUTOTARGETS,package,freetype))
>
>  $(FREETYPE_HOOK_POST_BUILD):
> -       -cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
> +       mkdir -p $(TARGET_DIR)/usr/lib
> +       cp -af $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib
>        $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
>        $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g"
> $(FREETYPE_DIR)/builds/unix/freetype-config
>        $(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g"
> $(FREETYPE_DIR)/builds/unix/freetype-config
>

 Patch attached

-- 
/roberto
-------------- next part --------------
A non-text attachment was scrubbed...
Name: freetype.patch
Type: text/x-diff
Size: 764 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081119/b7a00375/attachment.patch 
