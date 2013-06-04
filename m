From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Tue, 4 Jun 2013 13:29:59 +0200
Subject: [Buildroot] problem with external toolchain with hard float
In-Reply-To: <51ADA9AA.4060506@carallon.com>
References: <51ADA9AA.4060506@carallon.com>
Message-ID: <51ADCFB7.2020508@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 04.06.2013 10:47, schrieb Will Wagner:
> Hello All,
>
> I'm trying to update a project to 2013.05. I have an external toolchain (build with ct-ng 1.18) for arm that is hard float.
>
> The problem I have is that the elf files being built for the target do not run. This is because in each elf file the program interpreter is set as /lib/ld-linux.so.3 but if I look in the target filesystem that is generated it has /lib/ld-linux-armhf.so.3
>
> So it seems like my toolchain is somehow building elf files that won't run with the toolchain which has me pretty confused. Do I just need  a suitable sym link in my target fs or is this something wrong with how things are being built. Could it be that the toolchain wrapper is somehow forcing soft float?

If BR2_SOFT_FLOAT is set, the toolchain wrapper adds "-msoft-float" by default. But this option is only available if you build the toolchain with buildroot (or deprecated ct-ng backend)

Best regards
Patrick

-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
