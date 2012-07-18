From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 13:21:45 +0200
Subject: [Buildroot] [PATCH] external-toolchain: add Sourcery CodeBench
 ARM 2012.03
In-Reply-To: <1342606406-15332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1342606406-15332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20120718132145.685d1b97@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 12:13:26 +0200,
Fabio Porcedda <fabio.porcedda@gmail.com> a ?crit :

> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  toolchain/toolchain-external/Config.in   | 22 ++++++++++++++++++++++
>  toolchain/toolchain-external/ext-tool.mk |  3 +++
>  2 files changed, 25 insertions(+)

Thanks!

Unfortunately, adding this toolchain is not that simple. Most of the
201203 toolchains from CodeSourcery for the various architectures now
use glibc 2.15, which doesn't have an integrated RPC support. This
breaks an assumption and Buildroot and forces us to package the
libtirpc library. Some work has been started in this area, but it is
not very simple.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
