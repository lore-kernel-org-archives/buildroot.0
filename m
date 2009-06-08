From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 8 Jun 2009 14:38:17 +0200
Subject: [Buildroot] issue with gcc 4.4.0 & sqllite  & U-boot
Message-ID: <6016AF82C3F04F2584DF63620FA0600D@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
When building with the GCC 4.4.0 toolchain i noticed that sqllite no longer
works.
 
When executing mysql i got :
#mysql 
Can't modify /usr/lib/libstdc++.so.6's text section. Use GCC option -fPIC
for shared objects, please.
#
 
I  already have enabled PIC in building uclibc but it still has not solved
this.
Is there another place in buildroot where i could change something ?
 
 
 
The second issue is that u-boot no longer builds with GCC 4.4.0
 
the weak attribute yields an error when used with inline. 
 
void inline show_boot_progress (int val) __attribute__((weak,
alias("__show_boot_progress")));
 
should become
 
void show_boot_progress (int val) __attribute__((weak,
alias("__show_boot_progress")));
 
 
Johan
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090608/6fd97745/attachment.htm>
