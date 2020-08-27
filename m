From: Marie Maurer <marie.maurer@pixida.de>
Date: Thu, 27 Aug 2020 07:59:25 +0000
Subject: [Buildroot] Problem adding a new package tpm2-tss-engine
In-Reply-To: <VI1PR03MB452804C180D2B7AC473E9F0B98570@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB45286A4A50F37EBB0DC2E56298560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824160337.GB2246@scaer>
 <VI1PR03MB4528F54C1492D171A1B7B37B98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824163801.GC2246@scaer>
 <VI1PR03MB452804C180D2B7AC473E9F0B98570@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <VI1PR03MB45283D1D35C28CBE34590C5D98550@VI1PR03MB4528.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

unfortunately I was not yet able to solve the compilation problem.
Can someone give a hint how to deal with the following errors:

>>> tpm2-tss-engine 1.1.0-rc1 Extracting
gzip -d -c /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/dl/tpm2-tss-engine/tpm2-tss-engine-1.1.0-rc1.tar.gz | /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/bin/tar --strip-components=1 -C /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1   -xf -
>>> tpm2-tss-engine 1.1.0-rc1 Patching
>>> tpm2-tss-engine 1.1.0-rc1 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1 -name $file); do cp support/gnuconfig/$file $i; done; done
>>> tpm2-tss-engine 1.1.0-rc1 Configuring
>>> tpm2-tss-engine 1.1.0-rc1 Autoreconfiguring
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
libtoolize: copying file 'build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
configure.ac:51: error: possibly undefined macro: AC_SUBST
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:76: error: possibly undefined macro: AS_IF
configure.ac:121: error: possibly undefined macro: AC_MSG_WARN
configure.ac:173: error: possibly undefined macro: AC_MSG_ERROR
autoreconf: /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/bin/autoconf failed with exit status: 1
make: *** [package/pkg-generic.mk:239: /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1/.stamp_configured] Error 1
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$

Best regards,
Marie

-----Urspr?ngliche Nachricht-----
Von: Marie Maurer
Gesendet: Dienstag, 25. August 2020 09:34
An: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: buildroot at busybox.net
Betreff: AW: [Buildroot] Problem adding a new package tpm2-tss-engine

Hallo Yann,

you were right, I have overseen, that I must remove also remove TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP.

It makes progress:

marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ make
>>> tpm2-tss-engine 1.1.0-rc1 Configuring tpm2-tss-engine 1.1.0-rc1
>>> Autoreconfiguring
aclocal: installing 'm4/libtool.m4' from '/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/share/aclocal/libtool.m4'
aclocal: installing 'm4/ltoptions.m4' from '/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/share/aclocal/ltoptions.m4'
aclocal: installing 'm4/ltsugar.m4' from '/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/share/aclocal/ltsugar.m4'
aclocal: installing 'm4/ltversion.m4' from '/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/share/aclocal/ltversion.m4'
aclocal: installing 'm4/lt~obsolete.m4' from '/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/share/aclocal/lt~obsolete.m4'
aclocal: installing 'm4/pkg.m4' from '/home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/share/aclocal/pkg.m4'
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
libtoolize: copying file 'build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
configure.ac:51: error: possibly undefined macro: AC_SUBST
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:76: error: possibly undefined macro: AS_IF
configure.ac:121: error: possibly undefined macro: AC_MSG_WARN
configure.ac:173: error: possibly undefined macro: AC_MSG_ERROR
autoreconf: /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/host/bin/autoconf failed with exit status: 1
make: *** [package/pkg-generic.mk:239: /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1/.stamp_configured] Error 1 marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$

I must look how to deal with these new errors.

Best regards,

Marie

-----Urspr?ngliche Nachricht-----
Von: Yann E. MORIN <yann.morin.1998@free.fr>
Gesendet: Montag, 24. August 2020 18:38
An: Marie Maurer <marie.maurer@pixida.de>
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Problem adding a new package tpm2-tss-engine

Marie, All,

On 2020-08-24 16:21 +0000, Marie Maurer spake thusly:
> define TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
>         cd $(@D)/ && ./bootstrap
> endef
> TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS +=
> TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP

In case I was not clear in my previous reply: do _not_ use the bootstrap script, it is not needed.  So, drop your TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
macro altogether.

Setting _AUTORECONF = YES should be enough to trigger the autoreconfiguring of the package.

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'


Pixida GmbH
Ungererstr. 129
80805 M?nchen

Amtsgericht M?nchen - HRB 173520
Gesch?ftsf?hrer Johann Neubauer, Panagiota Dimou



www.pixida.de<http://www.pixida.de/>

[PIXIDA]



Unsere Datenschutzgrunds?tze<http://www.pixida.com/grundsaetze.html>
