From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 14:07:52 +0100
Subject: [Buildroot] [PATCH] dialog: bump to version 1.2-20150125
In-Reply-To: <1424519547-16093-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424519547-16093-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150221140752.3aa8449b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 21 Feb 2015 08:52:27 -0300, Gustavo Zacarias wrote:
> And drop thread requirement, it's really not necessary.
> For python-dialog that was already inherent in python itself.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied to next, thanks. Interestingly, it's you who added this thread
dependency because dialog needs MMU. And Peter applied the patch. See:

commit 9d9d842d871b8645f70c3a90f59f8e2e09935656
Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date:   Fri Dec 28 00:59:00 2012 +0000

    dialog: needs mmu
    
    Fixes
    http://autobuild.buildroot.net/results/b673ef6d6315dc5df77e000199a63f90904829d5
    
    Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 9d3462e..db5197f 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIALOG
        bool "dialog"
+       depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
        select BR2_PACKAGE_NCURSES
        select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
        help

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
