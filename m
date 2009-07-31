From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Fri, 31 Jul 2009 10:34:41 +0200
Subject: [Buildroot] BR2_UCLIBC_PROGRAM_INVOCATION symbol missing in
	external toolchain
Message-ID: <159a01660907310134l76b73595q634d30255cf8cf70@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

some time ago i started to use buildroot to build a system for
pc-appliances, but, for performance reason, i preferred to put glibc
instead of uclibc. So, in these days, after some work, i finally
managed to build a full toolchain using crosstool-NG. After a fresh
checkout from buildroot git (i've seen some patches committed for
external toolchains) i've seen, after that i disabled busybox, that i
can't select some stuff because of WCHAR and/or PROGRAM_INVOCATION
missing. Looking toolchain compile options i seen that
PROGRAM_INVOCATION is missing! I've seen that the symbol called
BR2_UCLIBC_PROGRAM_INVOCATION is only into toolchain/uClibc/Config.in
and not in toolchain/external-toolchain/Config.in (and or
Config.in.2).

Is that config symbol only for uClibc? It should appears in external
toolchains too or, however, packages that depends on this flag should
check if external toolchain is used?

Actually i put this symbol in external-toolchain Config.in to let the
system to compile, but i don't know if this is ok!


Really thanks for your support,

Best Regards,
Daniele

-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.phpsoft.it
http://www.dacci.it

Servizi:
- Sviluppo in C# e PHP
- Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
