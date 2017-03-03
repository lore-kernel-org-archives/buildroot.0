From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 11:01:40 +0100
Subject: [Buildroot] [PATCH] Revert "nano: bump to version 2.7.5"
In-Reply-To: <20170303095441.20062-1-gustavo@zacarias.com.ar>
References: <20170303095441.20062-1-gustavo@zacarias.com.ar>
Message-ID: <20170303110140.47eb0a47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 06:54:41 -0300, Gustavo Zacarias wrote:
> The bump causes build failure with musl, this new version uses with
> undefined REG_STARTEND which is a glibc-ism that isn't available for
> musl-based toolchains.
> The introduction of this is to address
> https://savannah.gnu.org/bugs/?50030 so it's not quite straightforward
> to fix.
> 
> This reverts commit d0035543432edddee4dcb017ac4dd74832133e89.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/nano/nano.hash | 2 +-
>  package/nano/nano.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
