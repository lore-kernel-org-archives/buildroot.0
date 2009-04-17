From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 17 Apr 2009 10:33:52 +0200
Subject: [Buildroot] Properly setting up hotplug
Message-ID: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 
 
cleaning :
 
I don't trust the disclean, it most ends op in a mess.
 
If i do a clean i do :
 
remove the entire root dir in project_build_arm
remove .root  as well
remove all contents from build_arm
remove all stuff in project_build_arm/../autotools-stamps.
 
i am still wondering why they have put dependencies in
project_build_arm/../autotools-stamps. instead of in build_arm
 
removing the entire root seems the only way to make sure packages enabled in
a previous build and disabled now are no longer a lonely ghost in the
rootfs.
 
 
besides this, there are still othter issues, the libssp.so.0 gets build but
not installed in the target root directory.
 
 
 
Johan
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090417/77507a20/attachment.htm>
