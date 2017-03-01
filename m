From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:54:33 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/sdl2: disable altivec
 built-in function for PowerPC
In-Reply-To: <20170228232453.3550-1-romain.naour@gmail.com>
References: <20170228232453.3550-1-romain.naour@gmail.com>
Message-ID: <20170301215433.23f5bb41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Mar 2017 00:24:52 +0100, Romain Naour wrote:
> As reported in this bug report [1], altivec support in SDL break
> arbitrary C++ code.
> 
> Issue reported by test-pkg script while testing supertux package:
>     error: could not convert 'true' from 'bool' to '__vector(4) __bool int'
> 
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
>  package/sdl2/sdl2.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
