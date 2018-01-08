From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:38:28 +0100
Subject: [Buildroot] [PATCH 1/2] core-dependencies: remove unneeded
 HOSTCC
In-Reply-To: <20171022141752.26105-1-arnout@mind.be>
References: <20171022141752.26105-1-arnout@mind.be>
Message-ID: <20180108233828.79bc8099@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 16:17:51 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> dependencies.sh uses HOSTCC_NOCCACHE directly, and this variable is
> exported from the top-level Makefile, so there is no need to pass
> HOSTCC to it. HOSTCC is not used at all in dependencies.sh.
> 
> Thus, we also no longer need to apply the HOSTCC override for
> core-dependencies. The core-depencies rule doesn't use HOSTCC or
> HOSTCXX.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/dependencies/dependencies.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
