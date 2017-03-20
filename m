From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:52:11 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: fix compile for missing baud
 defines
In-Reply-To: <20170320200020.11959-1-ps.report@gmx.net>
References: <20170320200020.11959-1-ps.report@gmx.net>
Message-ID: <20170320215211.3dec88b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 21:00:20 +0100, Peter Seiderer wrote:
> For sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h
> containing:
> 
>   /* These have totally bogus values and nobody uses them
>      so far. Later on we'd have to use say 0x10000x and
>      adjust CBAUD constant and drivers accordingly.
>   #define B2500000  0x00001010
>   #define B3000000  0x00001011
>   #define B3500000  0x00001012
>   #define B4000000  0x00001013  */
> 
> Fixes [1]:
> 
>   wiringSerial.c: In function 'serialOpen':
>   wiringSerial.c:78:28: error: 'B2500000' undeclared (first use in this function)
>        case 2500000: myBaud = B2500000 ; break ;
>                               ^
>   wiringSerial.c:78:28: note: each undeclared identifier is reported only once for each function it appears in
>   wiringSerial.c:79:28: error: 'B3000000' undeclared (first use in this function)
>        case 3000000: myBaud = B3000000 ; break ;
>                               ^
>   wiringSerial.c:80:28: error: 'B3500000' undeclared (first use in this function)
>        case 3500000: myBaud = B3500000 ; break ;
>                               ^
>   wiringSerial.c:81:28: error: 'B4000000' undeclared (first use in this function)
>        case 4000000: myBaud = B4000000 ; break ;
>                               ^
> 
> [1] http://autobuild.buildroot.net/results/5be/5bea1e95d1c7b444a5f0a5770251f1af3efc9c18
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ringSerial-fix-compile-for-missing-baud-d.patch | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
