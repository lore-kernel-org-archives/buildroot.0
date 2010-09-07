From: Herman Theron <htheron@hmo.ac.za>
Date: Tue, 7 Sep 2010 08:44:45 +0200 (SAST)
Subject: [Buildroot] Prelim RTAI integration help needed
In-Reply-To: <541305813.2396.1283840257891.JavaMail.root@her-mx1>
Message-ID: <47479143.2416.1283841885076.JavaMail.root@her-mx1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everybody

I'm currently trying to integrate RTAI into buildroot (which is the last hurdle to use buildroot for our embedded data logging systems). I've got a basic setup compiling and would like to share it with the Buildroot community. I've attached rtai.mk which allows me to compile and install RTAI. This is still in infancy, and I would like to get help from the buildroot community. (Please note that this is the minimum requirements for my project, so a lot of stuff is disabled).

There is some issues to get RTAI compiling under buildroot:

#1 You need to first build a linux kernel with an appropriate RTAI kernel patch. Then you can select RTAI and run make again.

#2 When compiling any of the kernel modules, make complains of "unknown option: --sysroot" and exits with an error. I've found that by deleting all the "--sysroot=...." text in the corresponding makefiles, that I was then able to get the compiler going. In the makefile I have made use of the POST_CONFIGURE_HOOK to delete occurrences of "--sysroot" from the GNUmakefile that is giving an error. Question: is this the best way to do it? Any suggestions?

#3 When installing to the staging area, RTAI expects $(STAGING_DIR)/usr/include/asm to be a symlink to $(STAGING_DIR)/usr/include/asm-i386 (for x86 architecture). Currently, $(STAGING_DIR)/usr/include is directory with .h files, and $(STAGING_DIR)/usr/include/asm-i386 is non-existent. I had to create $(STAGING_DIR)/usr/include/asm-i386 by hand, move the files from the "asm" directory to it, delete the "asm", create a softlink from "asm" to "asm-i386". Question, what will be the best way to handle this? In rtai.mk, a patch for RTAI? 

I would appreciate any help on this.

Thanks!

Herman Theron
-------------- next part --------------
A non-text attachment was scrubbed...
Name: rtai.mk
Type: application/octet-stream
Size: 2241 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100907/72b545d7/attachment.obj>
