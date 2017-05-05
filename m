From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 10:47:17 +0200
Subject: [Buildroot] [PATCH v2] lttng-tools: disable on uClibc/musl
In-Reply-To: <1493927478-27096-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1493927478-27096-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170505104717.13fa5ab1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 May 2017 21:51:18 +0200, Thomas Petazzoni wrote:
> lttng-tools has been broken on uClibc/musl since a long time due to
> dlmopen() and LM_ID_BASE not being implemented. The issue has been
> reported to the upstream lttng developers more than two months ago [1],
> and no fix has been provided. Therefore, it's time to disable it on
> uClibc and musl.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/f9e82a87618bcdcd46d670697b5ac75836f7250d/
>   (uclibc)
> 
>   http://autobuild.buildroot.net/results/cb0952483b580b053a585760e59d78d11f46fc60/
>   (musl)
> 
> [1] https://lists.lttng.org/pipermail/lttng-dev/2017-February/026921.html
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>  - Also disable on musl
> ---
>  package/lttng-tools/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
