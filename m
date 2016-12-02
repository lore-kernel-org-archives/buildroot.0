From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:00:18 +0100
Subject: [Buildroot] [PATCH v2] stella: fix bug when compiling with PPC
 altivec vectorization
In-Reply-To: <1480617204-25349-1-git-send-email-sergio.prado@e-labworks.com>
References: <1480617204-25349-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20161202220018.40c014b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Dec 2016 16:33:24 -0200, Sergio Prado wrote:
> PPC altivec vectorization triggers a bug when compiling with -std=c++11
> because "bool" is redefined in altivec.h.
> 
> src/emucore/Event.hxx:112:23: error: cannot convert ?bool? to ?__vector(4) __bool int? in assignment
>          myKeyTable[i] = false;
>                        ^
> 
> Acording to a bug report in GCC [1], "You need to use -std=g++11 or
> undefine bool after the include of altivec.h as context sensitive
> keywords is not part of the C++11 standard".
> 
> So let's compile with -std=gnu++11 by default.
> 
> Tested on ARM, x86 and PPC.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58241#c3
> 
> Fixes:
> http://autobuild.buildroot.net/results/0970d2c8e1787ceffc46b589522e53d52675e03c
> http://autobuild.buildroot.net/results/ec1bc57675b6e53af0cd33d7b99cd2e3bf5d9d7e
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
