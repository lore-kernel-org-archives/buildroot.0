From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:35:20 +0200
Subject: [Buildroot] [PATCH] fdk-aac: fix build with GCC 6
In-Reply-To: <1462094288-8110-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462094288-8110-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160501223520.73aba2d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 11:18:08 +0200, J?rg Krause wrote:
> GCC 6 defaults to -std=gnu++14 instead of -std=gnu++98. The C++11 standard does
> not allow "narrowing conversions" which is why building fdk-aac with GCC 6
> fails:
> 
> libAACenc/src/aacEnc_rom.cpp:661:1: error: narrowing conversion of '2180108801u' from 'unsigned int' to 'FIXP_DBL {aka long int}' inside { } [-Wnarrowing]
> 
> Use '-std=gnu++98' as suggested by "Porting to GCC 6" [1].
> 
> [1] https://gcc.gnu.org/gcc-6/porting_to.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/fdk-aac/fdk-aac.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, but please report the bug upstream so that they fix
in their source code or build system. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
