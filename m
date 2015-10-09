From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Oct 2015 13:18:56 +0100
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.4.5
In-Reply-To: <1444330752-31507-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444330752-31507-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5617B0B0.8080709@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/08/2015 07:59 PM, Gustavo Zacarias wrote:
> Fixes:
> 
> CVE-2015-5289: json or jsonb input values constructed from arbitrary
> user input can crash the PostgreSQL server and cause a denial of
> service.
> 
> CVE-2015-5288: The crypt() function included with the optional pgCrypto
> extension could be exploited to read a few additional bytes of memory.
> No working exploit for this issue has been developed.
> 
> sparc build fix patch upstream so drop it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>


$ grep ^POSTGRESQL_VERSION package/postgresql/postgresql.mk
POSTGRESQL_VERSION = 9.4.5

$ file output/target/usr/bin/postgres
output/target/usr/bin/postgres: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.
