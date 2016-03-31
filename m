From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:18:48 +0200
Subject: [Buildroot] [PATCH] norm: fix build failure with old headers
In-Reply-To: <1459431938-28257-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459431938-28257-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160331181848.00984a4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Mar 2016 10:45:38 -0300, Gustavo Zacarias wrote:
> The version check for the nfq_get_payload prototype is wrong since it's
> done against linux headers when in fact it changed with the 1.0.0
> release of libnetfilter_queue, leading to build failure in toolchains
> that have old headers when libnetfilter_queue is present. Fixes:
> http://autobuild.buildroot.net/results/c0e/c0e897a6db888d4a7e0302cdc1e0cbec7d1e88f3/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0002-protolib-drop-linux-version-check.patch   | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/norm/0002-protolib-drop-linux-version-check.patch

Applied to master, thanks. It would be good to submit the patch
upstream. Maybe the patch is not acceptable as-is because it will break
with older versions of libnetfilter_queue, but I guess an autoconf
check can be added for that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
