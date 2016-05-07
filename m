From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 7 May 2016 15:02:34 +0200
Subject: [Buildroot] Qt5 fails to compile with gcc 6.1.0
In-Reply-To: <20160507142800.6fec8574@free-electrons.com>
References: <572DBAB9.3060607@gmail.com> <572DD6A2.8030406@gmail.com>
 <20160507141147.65fe012a@free-electrons.com> <572DDCA5.8060204@gmail.com>
 <20160507142800.6fec8574@free-electrons.com>
Message-ID: <572DE76A.4070103@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 07/05/2016 14:28, Thomas Petazzoni ha scritto:

> However your version is "-dirty" which means you have modified
> Buildroot. But we have no idea which modifications you have made. Maybe
> those modifications are the reason for the failure?

I did the following:

git clone git://git.buildroot.net/buildroot
git pull

then I applied the patches you suggested for Qt5 and bluez5: 
https://patchwork.ozlabs.org/patch/612072/
Of course I changed the post-build script and the genimage commands in 
the boards directory, but I think I'm allowed to do this.

> Also, please don't use gcc 6.x for now, and stay with gcc 4.9, so
> please test with gcc 4.9.
>
> Please disable LTO support for the moment. It isn't enabled by default,
> and we don't test it that often, so please disable it for now.
>
> Please stay with the default of binutils 2.25 instead of selecting
> binutils 2.26.
>
> Once you have changed those configuration options and removed your local
> Buildroot modifications, please try again a complete build "make clean
> all" and see if it works or not. If it doesn't, I'll try to reproduce
> here.


Well, I've downloaded buildroot from scratch to be sure.
I confirm the "dirty" flag appears after applying the patches for 
Qt5/bluez5.

Attached there is the new .config file.
It's compiling right now. I will inform you of the results.

Thanks
Marco

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 92413 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160507/08754f04/attachment-0001.wsdl>
