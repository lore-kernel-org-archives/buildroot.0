From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:49:00 +0200
Subject: [Buildroot] [PATCH v3 2/2] axfs: add new filesystem type
In-Reply-To: <1444852286-12219-3-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444852286-12219-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444852286-12219-3-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <20151014234900.7688c48e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ariel D'Alessandro,

On Wed, 14 Oct 2015 16:51:26 -0300, Ariel D'Alessandro wrote:
> The Advanced XIP File System is a Linux kernel filesystem driver that
> enables files to be executed directly from flash or ROM memory rather
> than being copied into RAM. It has the ability to store individual
> *pages* in a file uncompressed/XIP or compressed/Demand Paged.
> 
> This commit only adds support for 'XIP all' mode, so all the files that
> have the execute attribute set will be XIP'ed.
> 
> At the moment, the FS is not supported in Linux mainline (v4.3-rc5), so
> the kernel has to be built with the axfs patches to be able to read it.
> Patches can be found here: https://github.com/jaredeh/axfs
> 
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  fs/Config.in      |  1 +
>  fs/axfs/Config.in | 16 ++++++++++++++++
>  fs/axfs/axfs.mk   | 13 +++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 fs/axfs/Config.in
>  create mode 100644 fs/axfs/axfs.mk

Applied with some minor tweaks:

    [Thomas: rewrap Config.in help text.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
