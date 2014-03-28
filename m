From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Fri, 28 Mar 2014 09:38:26 +0100
Subject: [Buildroot] - /bin/ld: cannot find -lcrypto Compilation
	wpa_suplicant
In-Reply-To: <20140328083110.GD26179@tarshish>
References: <EE97821C81277E459BEA5C6384C6F241012F0081F7FF@srvexch01.SODIELEC.local>
 <20140327212758.GA12104@w1.fi>
 <EE97821C81277E459BEA5C6384C6F241012F0081F800@srvexch01.SODIELEC.local>,
 <20140328083110.GD26179@tarshish>
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F0081F801@srvexch01.SODIELEC.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello every one,
I tried to compile the program wpa_suplicant, when I run make, I was able to create 2 files executable wpa_supplicant and wpa_cli but I have this error:

  CC  wpa_passphrase.c
/home/alberix2/Cross-Compiler/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/../lib/gcc/arm-marvell-linux-gnueabi/4.6.2/../../../../arm-marvell-linux-gnueabi/bin/ld: cannot find -lcrypto
collect2: ld returned 1 exit status
make: *** [wpa_passphrase] Error 1

I have looked on the internet and found that the problem may concerned about missing library file "libcrypto.so" in the directory /lib/usr, I went into the directory of my cross compiler:
/home/alberix2/../ACCESS_POINT2_prj/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib
I saw 2 file libcrypto.so.1.0.0 and libcrypto.so (this is just a link to libcrypto.so.1.0.0). Their permission is Read only, but even if I changed their permission to Read & Write, the error is still there and I don't know how to correct it.
So anyone can help me through this?
Thanks in advanced for your response.
Sincerely,


NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

________________________________________
De : Baruch Siach [baruch at tkos.co.il]
Date d'envoi : vendredi 28 mars 2014 09:31
? : Vu Hai NGUYEN
Cc : Jouni Malinen; hostap at lists.shmoo.com; Patrick CARNEIRO RODRIGUEZ
Objet : Re: RE : Compilation wpa_suplicant - /bin/ld: cannot find -lcrypto

Hi Vu Hai NGUYEN,

On Fri, Mar 28, 2014 at 09:18:10AM +0100, Vu Hai NGUYEN wrote:
> Thank you Jouni Malinen for your response, actually when I said I look in
> the directory /lib/usr I meant it was in my cross compile already,  sorry
> for not be clear.
> This is the path of my lib,
> /home/alberix2/Desktop/ACCESS_POINT_workspace/ACCESS_POINT2_prj/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib

This patch implies that you are using Buildroot to build wpa_supplicant. If
so, the Buildroot mailing list is the appropriate place to discuss package
dependency problems. Make sure to post your .config file so that others are
able to reproduce the build failure you see.

baruch
