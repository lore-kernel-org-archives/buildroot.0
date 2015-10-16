From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 16 Oct 2015 17:35:08 +0100
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.17
In-Reply-To: <1445010876-13077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1445010876-13077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5621273C.7030906@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/16/2015 04:54 PM, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-5291 - Remote attack on clients using session tickets or SNI
> 
> Also includes countermeasures against Lenstra's RSA-CRT attach for
> PKCS#1 v1.5 signatures (1.2.16) and the Logjam attack (1.2.15).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -E ^POLARSSL_VERSION package/polarssl/polarssl.mk
POLARSSL_VERSION = 1.2.17

$ file output/target/usr/lib/libpolarssl.so.1.2.17
output/target/usr/lib/libpolarssl.so.1.2.17: ELF 32-bit MSB shared
object, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with
unknown capability 0x41000000 = 0xf676e75, with unknown capability
0x10000 = 0x70401, stripped

Regards,

Vincent.
