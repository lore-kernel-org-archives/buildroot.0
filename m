From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 28 Feb 2012 15:43:29 +0100
Subject: [Buildroot] buildroot ncurses build problem
In-Reply-To: <130109022.1159713.1330439376600.JavaMail.root@zimbra22-e3.priv.proxad.net>
References: <1425693603.1137500.1330438475530.JavaMail.root@zimbra22-e3.priv.proxad.net>
 <130109022.1159713.1330439376600.JavaMail.root@zimbra22-e3.priv.proxad.net>
Message-ID: <CAAXf6LXn1Tdi9MLjqKEC1cGW+N4kU_YuiJD9xMVru1KVQNWcgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Feb 28, 2012 at 3:29 PM,  <snarf77@free.fr> wrote:
> Hi all,
>
> this my first post on this list so first of all hello to everybody.
>
> My wish is to create a real time kernel and a minimal rootfs for a atmel at91sam0g20ek eval board. Until now I did it the old way manually but I wanted to give a try to buildroot ti automate all the stuff.
>
> I downloaded buildroot and configure menuconfig simply with architecture = arm and target = arm926t and my first "make" was successful and the image is working fine. Good job guys !!
>
> But then each time I want to add a new package that depends on ncurses (in my case "nano" editor but this failed also even by simply selecting ncurses) I have my build failed in the ncurses directory with the following error:
>
> snarf77 at buildrootVM:~/Downloads/buildroot-2012.02-rc3/output/build/host-ncurses-5.7/c++$ make
> cd ../objects; ? -I../c++ -I../include -I. -DHAVE_CONFIG_H -I. -I../include ?-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 ?-DNDEBUG -I/home/snarf77/Downloads/buildroot-2012.02-rc3/output/host/usr/include/ncurses -I/home/snarf77/Downloads/buildroot-2012.02-rc3/output/host/include -I/home/snarf77/Downloads/buildroot-2012.02-rc3/output/host/usr/include ?-c ../c++/cursesf.cc
> /bin/sh: -I../c++: not found
> make: *** [../objects/cursesf.o] Error 127

Here you are running make from a build directory directly. This is not
supported.
You should run 'make' from the top-level buildroot directory, i.e.
~/Downloads/buildroot-2012.02-rc3

Do you have the same problem then?

>
>
> I'm runnning ubuntu 10.10 32bits and have installed libncurses5.7 if this matters.
>
> I have tried with buildroot 2011.11 and same issue so I guess it come either from my environment (ubuntu package missing ?) or from make option or buildroot configuration selection ???
>
> Many thanks in advance for your help as I'm stuck there..

Best regards,
Thomas
