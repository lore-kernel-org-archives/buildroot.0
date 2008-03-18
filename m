From: Reinier Coetzer <reinier.coetzer@gmail.com>
Date: Tue, 18 Mar 2008 12:57:14 +0200
Subject: [Buildroot] Buildroot compilation error
Message-ID: <823018ed0803180357s43bf8890s37521d7606aca432@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I want to cross-compile for my EBOX with a Vortex86SX CPU (
http://www.dmp.com.tw/tech/vortex86sx/).
The problem is that I have to use the 2.6.18.8 kernel as described by DMP. I
configured everything
with menuconfig, but I cant select kernel headers earlier than 2.6.21 for my
toolchain in menuconfig and I
have a feeling that is why I get the following error:

if [ -r System.map -a -x
/home/harry/Desktop/buildroot/build_i486/staging_dir/bin/i486-linux-depmod26
]; then
/home/harry/Desktop/buildroot/build_i486/staging_dir/bin/i486-linux-depmod26
-ae -F System.map -b
/home/harry/Desktop/buildroot/project_build_i486/Agritel/root -r
2.6.18.8-DMP; fi
make[1]: Leaving directory
`/home/harry/Desktop/buildroot/project_build_i486/Agritel/linux-2.6.18.8'
rm -f
/home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.18.8/build
rm -f
/home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.18.8/source
/home/harry/Desktop/buildroot/build_i486/staging_dir/bin/i486-linux-depmod26
-b /home/harry/Desktop/buildroot/project_build_i486/Agritel/root 2.6.23
WARNING: Couldn't open directory
/home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.23:
No such file or directory
FATAL: Could not open
/home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.23/modules.dep.temp
for writing: No such file or directory
make: ***
[/home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.18.8/modules.dep]
Error 1

I dont know what to change in order to avoid this error. I'm rather new to
kernel compilation so a detailed answer would be very much
appreciated. Thanks in advance!

Kind Regards
  Reinier
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080318/b8a554e1/attachment.htm 
