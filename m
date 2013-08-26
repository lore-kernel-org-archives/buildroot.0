From: Nicolas =?utf-8?B?TcOpbsOpZ2FsZQ==?= <nicolas.menegale@openwide.fr>
Date: Mon, 26 Aug 2013 15:41:51 +0200 (CEST)
Subject: [Buildroot] libffi target header installation problem
In-Reply-To: <1626579523.5503469.1377524132514.JavaMail.root@openwide.fr>
Message-ID: <1731940843.5504088.1377524511657.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everyone,

In libffi.mk:23: 
mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/

Wouldn't it make more sense this way ?
mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(STAGING_DIR)/usr/include/

Same thing for the LIBFFI_MOVE_TARGET_HEADERS hook below this line.

If so I can send a patch to correct that.

Thanks,
Nicolas.
