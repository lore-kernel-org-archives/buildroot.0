From: ngu <ngu@irts.fr>
Date: Fri, 7 Jul 2017 05:26:23 -0700 (PDT)
Subject: [Buildroot] Patch not being applied to out of tree package
Message-ID: <1499430383935-170337.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

My goal is to integrate a driver to buildroot.
From what I understand, the best way to do so is to create a package, this
is what I did. The package is out of tree which is not a problem a I
correctly set the BR2_EXTERNAL to the right path. I can generate a valid
image for my system and I even had a "hello world" driver as an external
package. For the driver I want to integrate, I need to fix a few calls
which, I believe, should be done with a patch. As I understand, there are at
least 2 ways to place the patch. The first one is to have a global patch
directory (BR2_GLOBAL_PATCH_DIR) or to place the patch in the package
directory. I did both.
My problem is that the patch seems to be ignored and is not applied.

For the info, I tried:
make mypackage-dirclean
make mypackage-patch V=1

The second command doesn't output anything about the patch, only the "rsync"
command.
I tested the same patch with a package in the tree (i.e. nano) and the patch
was found and applied (of course, it failed).

Could the patch not be applied because the source files are local? Is there
any reason why a patch could be ignored and not mentionned in the log? How
can I get additional information about what is going on during the patching
process?





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Patch-not-being-applied-to-out-of-tree-package-tp170337.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
