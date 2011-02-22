From: Steve Johnson <sjohnson228@gmail.com>
Date: Tue, 22 Feb 2011 12:10:32 -0800
Subject: [Buildroot] Errors using buildroot-2010.11 on Fedora 14 x86_64
Message-ID: <AANLkTikMr6bW=CpEH5RTq+jAm+Kd8K7YCLdDtY5E23yE@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get the following error when I try to use buildroot (this is the end of
the output):

rm -rf /home//projects/embeddedlinux/
test1/build-tools/buildroot-2010.11/output/target/usr/share/gtk-doc
rmdir
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target/usr/share
2>/dev/null
* make: [target-finalize] Error 1 (ignored)*
find
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target
-type f -perm +111 '!' -name 'libthread_db*.so*' | \
               xargs
/home//projects/embeddedlinux/test1/tools1/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
--remove-section=.comment --remove-section=.note 2>/dev/null || true
find
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target/lib/modules
-type f -name '*.ko' | \
               xargs -r
/home//projects/embeddedlinux/test1/tools1/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
--remove-section=.comment --remove-section=.note --strip-unneeded ||
true
find:
`/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target/lib/modules':
No such file or directory
mkdir -p
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target/etc
# Mandatory configuration file and auxilliary cache directory
# for recent versions of ldconfig
touch
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target/etc/ld.so.conf
mkdir -p
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target/var/cache/ldconfig
if [ -x
"/home//projects/embeddedlinux/test1/tools1/usr/bin/arm-unknown-linux-uclibcgnueabi-ldconfig"
]; \
       then \

 /home//projects/embeddedlinux/test1/tools1/usr/bin/arm-unknown-linux-uclibcgnueabi-ldconfig
-r
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target;
\
       else \
               /sbin/ldconfig -r
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target;
\
       fi
/home//projects/embeddedlinux/test1/tools1/usr/bin/arm-unknown-linux-uclibcgnueabi-ldconfig:
*can't resolve /usr/X11R6/lib in chroot .: No such file or directory
*
/home//projects/embeddedlinux/test1/tools1/usr/bin/arm-unknown-linux-uclibcgnueabi-ldconfig:
*skipping /usr/X11R6/lib: No such file or directory
*echo 2010.11 >
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/target/etc/br-version
rm -f
/home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/build/.fakeroot*
$

Thanks,

Steve
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110222/b95d11fd/attachment.html>
