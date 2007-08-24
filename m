From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 24 Aug 2007 10:54:48 +0200
Subject: [Buildroot] Problem calling ldconfig in ext2root.mk
In-Reply-To: <46CE228B.2040907@sri.com>
References: <46CE228B.2040907@sri.com>
Message-ID: <20070824085448.GA13098@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 23, 2007 at 05:12:59PM -0700, Todd Valentic wrote:
>Hi -
>
>I'm having a problem with a recent change in ext2root.mk (showed up in 
>r19618):
>
>http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/target/ext2/ext2root.mk?rev=19618&r1=19604&r2=19618
>
>-	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
>+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
>
>
>I'm using an external toolchain that doesn't have an ldconfig, so the 
>make bombs out at this
>point. The makefile used to ignore this, which was OK for my system. 
>Should there be a check
>to see if $(TARGET_LDCONFIG) exists?

Does the attached is any better?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2.target_ldconfig-conditional.diff
Type: text/x-diff
Size: 4164 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070824/56e4cb3b/attachment.bin 
