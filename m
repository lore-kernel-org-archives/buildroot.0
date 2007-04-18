From: Arnon Meydav <ArnonM@metalinkBB.com>
Date: Wed, 18 Apr 2007 09:56:20 +0300
Subject: [Buildroot] Need help building toolchain for mips32
Message-ID: <5002BD9FB045734DB9F20119530FB01701129EBC@ilmail2.metalink.dsl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all, 
I am new to the world of buildroot.
I am trying to build a toolchain for a mips32 based CPU (based on 24K
core).
I selected mips32 in the menuconfig and also as the ABI, but buildroot
fails with the following error:
 
make MAKE="make -j1" -C
/home/arnonm/RG/buildroot/toolchain_build_mips_nofpu/uClibc \
        PREFIX= \
        DEVEL_PREFIX=/ \
        RUNTIME_PREFIX=/ \
        HOSTCC="gcc" \
        all
make[1]: Entering directory
`/home/arnonm/RG/buildroot/toolchain_build_mips_nofpu/uClibc'
make[2]: `conf' is up to date.
ln -fs sgidefs.h ./include/
:0: error: -march=mips32 is not compatible with the selected ABI
:0: error: -march=mips32 is not compatible with the selected ABI
  CC ldso/ldso/ldso.oS
ldso/ldso/ldso.c:1: error: -march=mips32 is not compatible with the
selected ABI
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/home/arnonm/RG/buildroot/toolchain_build_mips_nofpu/uClibc'
make: ***
[/home/arnonm/RG/buildroot/toolchain_build_mips_nofpu/uClibc/lib/libc.a]
Error 2
 
 
 
Any suggestions?
Thanks,
 - Arnon Meydav
 


-- Disclaimer: --
This e-mail is intended solely for the person to whom it is addressed and may contain confidential or legally privileged information. Access to this e-mail by anyone else is unauthorized. If an addressing or transmission error has misdirected this e-mail, please notify the author by replying to this e-mail and destroy this e-mail and any attachments. 
E-mail may be susceptible to data corruption, interception, unauthorized amendment, viruses and delays or the consequences thereof. If you are not the intended recipient, be advised that you have received this email in error and that any use, dissemination, forwarding, printing or copying of this email is strictly prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070418/ae4e3f5a/attachment.htm 
