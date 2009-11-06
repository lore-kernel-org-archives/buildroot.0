From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 6 Nov 2009 08:47:16 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
Message-ID: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Morning, all!

I had a look in the archives, but did not find any recent information that  
seems to cover the problems I am experiencing.

About 18 months ago, we had our target build system configured by a  
consultant. This is an Xscale target. We made the root FS fit in the  
allotted space, just fine. Preparing to add a new controller card to our  
product range, I decided to download a fresh Buildroot, then configure to  
match the old setup (which has issues building on Ubuntu 9.04 or later,  
possibly due to some package we have added). Busybox and uclibc config  
files are copied from the previous buildroot environment.

As it turns out, the rootfs of this configuration is several MBs larger  
than the previous one, mainly due to an explosion of shared libraries.

/usr/lib has a lot of glib*.so files that were not previously there, and  
also iconv has been added. In addition, both libstd++.so.6.0.9 and  
libstd++.so.6.0.10 are added. /usr/lib is now twice the size of that of  
the previous target, meaning it won't fit on the target anymore. I believe  
glib* are parts of GLIBC, how come it is installed when I am trying to  
build a uclibc system?

I tried to prune the rootfs a bit to match the old target rootfs, but  
after that NO applications built with the buildroot toolchain works. All  
system utils work perfectly, but nothing I have written works. All apps,  
whether a small simple C app or a large C++ app, die with a Segmentation  
fault immediately, before reaching main(). GDB/GDBserver is not useful for  
telling where the problem lies.


If anyone would like to help investigate the problem, I can send my  
configuration files to you to see if you are able to recreate the  
behaviour.

-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
