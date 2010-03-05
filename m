From: Damien Borie <dbe@terawatt.fr>
Date: Fri, 05 Mar 2010 16:36:20 +0100
Subject: [Buildroot]  Compilation error of Buildroot with X server
Message-ID: <4B9124F4.40206@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
First I have to explain that I'm new on this mailing list, beginner on 
Buildroot, and not a great specialist of Linux.

The situation : we use Buildroot to create a embedded distribution for a 
device with Touchscreen and a beautiful GUI.
We've just changed the hardware for the same model has before, but with 
a larger screen. So now it's seems impossible to manage display with 
only the framebuffer and Vesa drivers. So I must create a new version of 
the distribution which will allow me to install the specific driver of 
the graphic chipset.
As it's the same hardware (except screen, which only change size 
anyway), I took the old configurations file (for Kernel, Busybox, and 
Buildroot). I only add the option "Enable loadable module support" in 
Kernel configuration, so I'll can install my drivers.
In Buildroot configuration, I'm a bit lost but I only have to active X 
server. So I choose X Window system server "tinyX" instead of "none". 
Then I check "Xorg X window system X11r7 release 7.4" options, and 
choose xorg-server. And, that's all for a first test.
Here comes the problem. During compiling, I got the following error log. 
I think it is strange that it is searching for a file with a long path 
like this, which doesn't exists of course. The file 
/usr/local/toolchain/i486-twa-linux-gnu//usr/lib//libXau.la exists.
I search for long hours but didn't found something really interesting. 
All I know is Libtool sometimes need to the librairies to be installed  
on the host to compile them successfully, so I just installed libXau but 
nothing changes.
I really think the path is the problem, but I don't know how to change 
it as I'm not familiar at all with Libtool.
Some advices for me?

libtool: link: warning: library 
`/usr/local/toolchain/i486-twa-linux-gnu/usr/lib/libxcb-xlib.la' was moved.
grep: 
/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu//usr/lib//libXau.la: 
No such file or directory
/home/labo/matrice5/buildroot/toolchain_build_i486/bin/sed: can't read 
/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu//usr/lib//libXau.la: 
No such file or directory
libtool: link: 
`/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu/usr/local/toolchain/i486-twa-linux-gnu//usr/lib//libXau.la' 
is not a valid libtool archive
make[4]: *** [libX11.la] Erreur 1
make[4]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/build_i486/xlib_libX11-1.1.5/src ?
make[3]: *** [all-recursive] Erreur 1
make[3]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/build_i486/xlib_libX11-1.1.5/src ?
make[2]: *** [all] Erreur 2
make[2]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/build_i486/xlib_libX11-1.1.5/src ?
make[1]: *** [all-recursive] Erreur 1
make[1]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/build_i486/xlib_libX11-1.1.5 ?
make: *** 
[/home/labo/matrice5/buildroot/build_i486/xlib_libX11-1.1.5/.stamp_built] 
Erreur 2

Thanks,
Damien Borie.
