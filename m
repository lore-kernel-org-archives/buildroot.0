From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 16 Oct 2012 16:16:48 +0200
Subject: [Buildroot] no /dev/console;
	/dev/null when booting with initrd of type 'ext2'
Message-ID: <507D6C50.4060607@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When booting with an initrd of type "ext2", as it is the case when using 
a generated ISO image,
the kernel (a 3.2.21 in my case) does not automagically create the 
"/dev/null" and "dev/console" entries,
whereas it does when using a cpio.

Would the solution be to always have these inodes created in 
'device_table.txt' ?
(Works in my case, I do not plan to use the static table)

Or change the ISO generation for using cpio instead of ext2 ?

Thanks
Thierry

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121016/175bc41e/attachment.html>
