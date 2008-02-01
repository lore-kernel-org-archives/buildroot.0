From: jake sullivan <jacob_sullivan@yahoo.com>
Date: Thu, 31 Jan 2008 21:02:34 -0800 (PST)
Subject: [Buildroot] make clean not so clean
Message-ID: <214360.55769.qm@web56410.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure how to go about fixing this, but I have been able to recreate an annoying little bug (that I think is the source of a number of other newb problems).

I started by building a basic system, got my cross compilers working, and got my embedded system working on a normal hard drive (ext2).  When I went to add jffs2 as a target output, I got a lot of errors about missing things (e.g. the shadow directory).  This was similar to earlier problems that I had solved by deleting the whole directory and re checking out buildroot from svn (make clean didn't solve any of the previous problems).   This time I tried "make clean" again, didn't work, but "make distclean" did work.  It was a little annoying that I had to redownload all the source, but I didn't lose the settings from the buildroot "make menuconfig" (but I did lose the "make menuconfig" settings for the kernel).  I tried checking out another copy of buildroot, building it without jffs2 adding some features, building, adding jffs2 and build error.  I then tried make clean, no luck, and then make distclean.  After all the source was downloaded again, the
 build worked great.

My gut says to update "make clean" to delete all the config files (and basically everything but the source files), but before I put work into making and testing a patch, I want to make sure that is the right approach...

Jake






      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
