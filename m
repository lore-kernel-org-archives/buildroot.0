From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Mon, 19 Jul 2021 19:16:56 +0300
Subject: [Buildroot] Question Linux-Module infrastructure
Message-ID: <CACaKL1z3AucmvN0SXF=E09fdTRF+fOfvLvBOPY_ogAo717NOKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210719161656.VNnizS3q4KgwmLW7vUedH8m1MujoJH0En_WvU3GCI3o@z>

Hello,

I am using external tree build in my project. Trying to add a linux kernel
driver that i am developing.
My problem is that, the sources of my driver are not flat but arranged, for
various reasons in the following manner:
<mydriver>
               <some files>
               <top makefile>
              +--- inc
                   <shared includes>
              +--- user
                     <files>
                      <Makefile>
              +--- kernel
                       <files>
                       <Makefile>

My hal.mk is  (hal is the name of the package)

HAL_VERSION = 1.0.0
HAL_SITE =  ../top/source/hal
HAL_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))

My problem is that, with the HAL_SITE above, everything is rsync'ed
correctly in the br/output dir, but the driver (*in the kernel subdir*)
fails to compile.
On the other hand, if HAL_SITE =  ../top/source/hal/kernel

then obviously only a part of the files would be rsync'ed and the shared
inlcude files will be missing (|for example) .... but the kernel driver
will be build (and eventually fails because of the shared include files)

What am I missing ? this must be a small detail that i am completely
overlooking ...

Thanks,
Jacques
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210719/3e1fbd6a/attachment-0002.html>
