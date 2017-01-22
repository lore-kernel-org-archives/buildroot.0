From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:52:18 +1100
Subject: [Buildroot] [PATCH] package/hplip: fix build by bumping to
 version 3.16.11
In-Reply-To: <20170121191314.11474-1-joerg.krause@embedded.rocks>
References: <20170121191314.11474-1-joerg.krause@embedded.rocks>
Message-ID: <20170122175218.7e97670b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 20:13:14 +0100, J?rg Krause wrote:
> Adjust patch #2 to apply successfully.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bee/beea88e0848ccabcafe6b92c2a69074ed1114225/
> http://autobuild.buildroot.net/results/4ba/4ba68d3e6764f395f3314c46c4d06b101c23479c/
> http://autobuild.buildroot.net/results/345/3455044679a497fbee72378e59178724305720d9/
> .. and many more.
> 
> The previous version 3.15.11 failed to build because of:
> 
> ```
> hpijs/hpcupsfax.cpp: In function 'int main(int, char**)':
> prnt/hpijs/hpcupsfax.cpp:651:5: error: 'ppd_file_t' was not declared in
> this scope
>      ppd_file_t          *ppd;
>      ^
> ```
> 
> `ppd_file_t` is defined in "cups/ppd.h" which was not included in 3.15.11, but
> is in 3.16.11.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch | 2 +-
>  package/hplip/hplip.hash                                        | 2 +-
>  package/hplip/hplip.mk                                          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
