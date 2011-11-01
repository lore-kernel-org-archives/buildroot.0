From: D M <d_mo1234@yahoo.com>
Date: Mon, 31 Oct 2011 19:02:37 -0700 (PDT)
Subject: [Buildroot] Make sure that dest dir exists before installing mtd
	files
Message-ID: <1320112957.28322.YahooMailNeo@web161421.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I ran into a situation where a custom target skeleton did not have a /usr/sbin
- it relied on something else to make it (busybox?).  So when mtd.mk tried to
install things to it, install bombed out.  (I think that we were probably using
the new version of "make", which no longer sorts wildcards in alphabetical
order - so mtd might have been compiled before busybox.) I have attached a patch to add -D to the install commands. 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: add_mtd_install_dir_fix.patch
Type: application/octet-stream
Size: 884 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111031/61ce0deb/attachment-0001.obj>
