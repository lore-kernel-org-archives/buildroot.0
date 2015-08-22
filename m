From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 23 Aug 2015 01:13:29 +0300 (IDT)
Subject: [Buildroot] How to upgrade Nodejs version on buildroot???
In-Reply-To: <CA+yqE7-Z1zZoTzUtneSEZ2_O9Oy3xPTiZgAG6g3b87QiEDVJTg@mail.gmail.com>
References: <CA+yqE7-Z1zZoTzUtneSEZ2_O9Oy3xPTiZgAG6g3b87QiEDVJTg@mail.gmail.com>
Message-ID: <alpine.DEB.2.11.1508230050140.3441@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hmidi,
There isn't any way to upgrade a Buildroot root filesystem or a particular 
package in a Buildroot filesystem. In the general case, you need to 
replace the entire filesystem. The reason for this is that Buildroot does 
not produce a "distribution", it only produces a hierarchy of directories 
containing files that are installed at the time you generate the 
filesystem. Buildroot does not have a package system that you can use to 
add or remove or upgrade a package after the filesystem is generated.

If you don't have the config file for the Buildroot filesystem that you 
are using, then your best option is to cross compile the nodejs version 
that you need and set the PREFIX and DESTDIR variables in the nodejs 
Makefile to somewhere under your home directory and then copy that 
directory into your current root filesystem, probably to /usr/local/.
Best regards,

  - yba


On Fri, 21 Aug 2015, Hmidi Slim wrote:

> Date: Fri, 21 Aug 2015 12:08:46 +0200
> From: Hmidi Slim <hmidi.slim1@gmail.com>
> To: buildroot at busybox.net, Thomas Petazzoni <thomas.petazzoni@enix.org>,
>     Yann E. MORIN <yann.morin.1998@free.fr>
> Subject: [Buildroot] How to upgrade Nodejs version on buildroot???
> 
> How to upgrade nodejs from 0.10.38 to 0.12.7 for ARM cortex A8
> 
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
-------------- next part --------------
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
