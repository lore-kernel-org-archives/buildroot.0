From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 27 Aug 2012 22:46:35 +0200
Subject: [Buildroot] qmake -o Makefile cannot create Makefile
Message-ID: <CAAfyv35hHwKR9v4-7OtqQhy6p4B7dkCnr0ED6pDG4aUuota=YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to add qt based application to be compiled in buildroot.
App is using qmake infrastructure which is not supported in BR.

I just want to hack it somehow so choose generic-package and plan use configure
step to generate Makefile with qmake (then continue with Makefile).

mk file:
+#############################################################
+#
+# song
+#
+#############################################################
+
+SONG_VERSION = master
+SONG_SITE    = https://github.com/nandra/songPresentation.git
+SONG_SITE_METHOD = git
+
+define SONG_CONFIGURE_CMDS
+	$(HOST_DIR)/usr/bin/qmake -o Makefile -v $(@D)/songPresentation.pro
+endef
+
+define SONG_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define SONG_INSTALL_TARGET_CMDS
+	install -D -m 0755 $(@D)/songPresentation
$(TARGET_DIR)/usr/bin/songPresentation
+endef
+
+$(eval $(generic-package))
+

Problem is that when is called SONG_CONFIGURE_CMDS no Makefile is created.
Try to cd $(@D); $(HOST_DIR)/usr/bin/qmake seems to work but Makefile
is created in
BR root directory. Seems I'm doing something wrong. Any ideas? Thanks.

Regards,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
