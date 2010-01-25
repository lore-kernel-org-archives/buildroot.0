From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Mon, 25 Jan 2010 12:41:26 +0530
Subject: [Buildroot] Target finalize Error with buildroot
Message-ID: <532dd5841001242311q4e247324s7217fe9b6b794b84@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
i was trying to build a Jffs2 filesystem for my target board
AT91sam9261. Everything compiles n builds but stops at the last point
with the following error

rm -rf /media/disk-1/buildroot/buildroot/output/build/buildroot-config
mkdir -p /media/disk-1/buildroot/buildroot/output/build
cp -dpRf package/config/buildroot-config
/media/disk-1/buildroot/buildroot/output/build/buildroot-config
rm -rf /media/disk-1/buildroot/buildroot/output/target/usr/include
/media/disk-1/buildroot/buildroot/output/target/usr/lib/pkgconfig
find /media/disk-1/buildroot/buildroot/output/target/lib \( -name
'*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
find /media/disk-1/buildroot/buildroot/output/target/usr/lib \( -name
'*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
rm -rf /media/disk-1/buildroot/buildroot/output/target/usr/man
/media/disk-1/buildroot/buildroot/output/target/usr/share/man
rm -rf /media/disk-1/buildroot/buildroot/output/target/usr/info
/media/disk-1/buildroot/buildroot/output/target/usr/share/info
find /media/disk-1/buildroot/buildroot/output/target -type f -perm
+111 | xargs /media/disk-1/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-strip
--remove-section=.comment --remove-section=.note 2>/dev/null || true
/media/disk-1/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-ldconfig
-r /media/disk-1/buildroot/buildroot/output/target 2>/dev/null
make: *** [target-finalize] Error 127

 is ther something additional tat needs to be enabled?  or any fix to
this? thanks.
warm regards,
Ravi Kulkarni.
