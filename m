From: Asbjoern Laurberg <asl@thrane.com>
Date: Mon, 05 Oct 2009 11:18:12 +0200
Subject: [Buildroot] compile error with 'crtstuff.c'
In-Reply-To: <1D6034426110564DA0DEA9EE9793B38357C834B900@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B38357C834B900@NBE-MBX01.americas.swk.pri>
Message-ID: <4AC9B9D4.5020305@thrane.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heyendal, Carl wrote:
> Hi,

Hi,

> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c 
> -DCRT_BEGIN
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c: 
> In function '__do_global_dtors_aux':
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: 
> error: '__DTOR_LIST__' undeclared (first use in this function)
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: 
> error: (Each undeclared identifier is reported only once
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: 
> error: for each function it appears in.)

To get GCC compiling in Buildroot with a ARM926 + EABI-configuration the 
following post+patch was the solution:

http://www.mail-archive.com/gcc-bugs at gcc.gnu.org/msg115966.html

-- 
Best regards,
Asbjoern Laurberg
Development Engineer
Thrane & Thrane A/S
