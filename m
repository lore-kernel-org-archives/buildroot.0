From: Reinier Coetzer <reinier.coetzer@gmail.com>
Date: Mon, 24 Mar 2008 20:39:48 +0200
Subject: [Buildroot] Fwd: Buildroot compilation error with 2.6.18.8 kernel
In-Reply-To: <823018ed0803191118j6146663l8a4f9bc53af05fb8@mail.gmail.com>
References: <823018ed0803191118j6146663l8a4f9bc53af05fb8@mail.gmail.com>
Message-ID: <823018ed0803241139j4ebf4034qb9cf5c8cb8525dd8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I noticed that no one responded to my previous post, so I'm trying again. If
there is something wrong with
how I post please let me know!

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
kernel compilation so a detailed answer would be very much appreciated.
Thanks in advance!

Kind Regards
  Reinier
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080324/b0845abf/attachment-0001.htm 
