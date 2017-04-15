From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 12:18:00 +0200
Subject: [Buildroot] [PATCH v5 3/4] package/supertux: fix bug when
 compiling with PPC altivec vectorization
In-Reply-To: <20170325215901.15044-3-romain.naour@gmail.com>
References: <20170325215901.15044-1-romain.naour@gmail.com>
 <20170325215901.15044-3-romain.naour@gmail.com>
Message-ID: <20170415121800.2753cd00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 22:59:00 +0100, Romain Naour wrote:
> From [1]:
> Acording to a bug report in GCC [2]:
> "You need to use -std=g++11 or undefine bool after the include of altivec.h
> as context sensitive keywords is not part of the C++11 standard".
> 
> So use gnu++11 instead of c++11 only for altivec system.
> 
> This allow to revert [3] and keep Altivec vectorization.
> 
> [1] 0024465d8a7b51f7fc7c9e8581072695d869adca
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58241#c3
> [3] d2903aaf1314b50a8a10ce937d2b33c5c42e463e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/supertux/supertux.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
