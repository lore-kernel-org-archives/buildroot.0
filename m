From: RainerB <berns@BEKA-Elektronik.de>
Date: Thu, 12 Mar 2009 06:33:52 -0700 (PDT)
Subject: [Buildroot]  Directfb TSlib
Message-ID: <22476430.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

i use svn 25623 and a modified at91sam9263_defconfig.(Config is attached).
I'am able to build a rootfile and to mount it.
After exporting some values for TSLIB ts_test and ts_calibrate runs.

df_andi fails with :
df_andi: can't resolve symbol 'tslib_parse_vars'

I noticed this problem already in the past. 
(https://lists.berlios.de/pipermail/tslib-general/attachments/20070217/fbdca453/attachment.ksh
)

I rebuild and replace the following libs:

dejitter.so
linear.so
pthres.so
variances.so

Now fd_andi runs until the messages appears :
f_andi.c <504>:
        (#) DirectFBError [dfb->CreateImageProvider( dfb, DATADIR"/tux.png",
&provider )]: No (suitable) implementation found!
The file tux.png is located in /usr/share.

I'am not sure, but maybe DATADIR is not set correctly during the build
process ?


I run strace df_andi (The output is attached) and noticed something strange
:
....
open("/home/rainer/Entwicklung/buildroot/build_arm/staging_dir/usr/lib/libdirect-1.2.so.0",
O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libdirect-1.2.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libdirect-1.2.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/usr/lib/libdirect-1.2.so.0", O_RDONLY) = 12
...


More important for me gtk-demo runs and now i try to build a test
application with gtk+ and libglade.
  

Regards

Rainer

http://www.nabble.com/file/p22476430/log.txt log.txt 
http://www.nabble.com/file/p22476430/config config 


-- 
View this message in context: http://www.nabble.com/Directfb-TSlib-tp22476430p22476430.html
Sent from the BuildRoot mailing list archive at Nabble.com.
