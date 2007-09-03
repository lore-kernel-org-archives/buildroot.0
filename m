From: Hebbar <gururajakr@sanyo.co.in>
Date: Sun, 2 Sep 2007 18:57:53 -0700 (PDT)
Subject: [Buildroot] Error when building to freetype. missing include
	directory
Message-ID: <12455411.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

   I am trying to build arm926ejs eabi toolchain with latest buildroot
snapshot. i am getting this error when tryng make world. I have also
attached the syaging_dir folder structure for reference.


<snip>
<snip>
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/libfreetype.so
ln -sf ./freetype2/freetype
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/include/freetype
ln -sf ../usr/include/freetype2/freetype
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/include/freetype
ln: creating symbolic link
`/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/include/freetype'
to `../usr/include/freetype2/freetype': No such file or directory
make: ***
[/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/include/freetype]
Error 1


root at box124:~/project/original/bldrt/buildroot# ls -la
build_arm/staging_dir/
total 1
drwxr-xr-x 6 root root  224 Sep  3 12:34 .
drwxr-xr-x 8 root root  232 Sep  3 12:39 ..
-rw-r--r-- 1 root root    0 Sep  2 19:42 .fakeroot.00000
lrwxrwxrwx 1 root root   23 Sep  3 12:33 arm-linux ->
arm-linux-uclibcgnueabi
drwxr-xr-x 3 root root   80 Sep  3 12:34 arm-linux-uclibcgnueabi
drwxr-xr-x 2 root root   48 Sep  2 19:42 bin
drwxr-xr-x 3 root root 1072 Sep  3 12:41 lib
drwxr-xr-x 8 root root  208 Sep  3 12:38 usr


root at box124:~/project/original/bldrt/buildroot# ls -la
build_arm/staging_dir/usr/
total 6
drwxr-xr-x  8 root root  208 Sep  3 12:38 .
drwxr-xr-x  6 root root  224 Sep  3 12:34 ..
drwxr-xr-x  5 root root  152 Sep  3 12:03 arm-linux-uclibcgnueabi
drwxr-xr-x  2 root root 2152 Sep  3 12:41 bin
drwxr-xr-x 23 root root 3208 Sep  3 12:41 include
drwxr-xr-x  5 root root 1464 Sep  3 12:39 lib
drwxr-xr-x  3 root root   72 Sep  2 22:24 libexec
drwxr-xr-x  5 root root  120 Sep  3 12:39 share
root at box124:~/project/original/bldrt/buildroot# 

-- 
View this message in context: http://www.nabble.com/Error-when-building-to-freetype.-missing-include-directory-tf4369917.html#a12455411
Sent from the BuildRoot mailing list archive at Nabble.com.
