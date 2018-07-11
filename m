From: MOHAMMAD RASIM <mohammad.rasim96@gmail.com>
Date: Wed, 11 Jul 2018 14:55:27 +0300
Subject: [Buildroot] At what stage the init script is created and can be
 used within the post build script?
Message-ID: <93b3645f-29f9-6864-5177-ec8ca41474fb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm building buildroot as a cpio initramfs (BR2_TARGET_ROOTFS_CPIO=y) 
and I have a post build script that edits the /init script like so:
sed -i "s/something/anotherthing/" ${TARGET_DIR}/init
The script worked fine when I used buildroot-2018.02.3 but now I want to 
build using the latest buildroot from git repo(master branch, latest 
commit is 0ce56fbdf6469cf9bbda168ffe75480ae811acaa as of writing this 
messege) and the script can't find the /init script and errors out:

|sed: can't read /home/mohammad/buildroot/output/target/init: No such 
file or directory

|so clearly the init script is not created until the cpio archive is 
created.
So how can I access the /init script from the post-build script ?

Thanks
||
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180711/cbaa9581/attachment.html>
