From: Todd Valentic <todd.valentic@sri.com>
Date: Thu, 23 Aug 2007 17:12:59 -0700
Subject: [Buildroot] Problem calling ldconfig in ext2root.mk
Message-ID: <46CE228B.2040907@sri.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi -

I'm having a problem with a recent change in ext2root.mk (showed up in 
r19618):

http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/target/ext2/ext2root.mk?rev=19618&r1=19604&r2=19618

-	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null


I'm using an external toolchain that doesn't have an ldconfig, so the 
make bombs out at this
point. The makefile used to ignore this, which was OK for my system. 
Should there be a check
to see if $(TARGET_LDCONFIG) exists?

Todd
