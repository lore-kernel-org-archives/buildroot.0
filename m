From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Wed, 27 Aug 2008 04:57:04 -0700 (PDT)
Subject: [Buildroot]  xml2-config and xslt-config editing
Message-ID: <19179467.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have found that I need to edit the xml2-config and xslt-config file after
doing a build.
Much the same as freetype.
Would anyone have any objections to this being done?
$(LIBXSLT_HOOK_POST_INSTALL): 
	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g"
$(STAGING_DIR)/usr/bin/xslt-config
	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g"
$(STAGING_DIR)/usr/bin/xslt-config
	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g"
$(STAGING_DIR)/usr/bin/xslt-config
	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g"
$(STAGING_DIR)/usr/bin/xslt-config
	touch $@

Similar for xml2-config

Finally, 
Would it be too dangerous to in Makefile.autotools.in do the above on all
/usr/bin/*-config.  Is it better to have this done on a per package basis or
hidden?
-- 
View this message in context: http://www.nabble.com/xml2-config-and-xslt-config-editing-tp19179467p19179467.html
Sent from the BuildRoot mailing list archive at Nabble.com.
