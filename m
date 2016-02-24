From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 11:46:30 +0100
Subject: [Buildroot] [PATCH v2] Trousers: disable pie option on ARC
In-Reply-To: <1453128253-17722-1-git-send-email-ltrimas@synopsys.com>
References: <1453128253-17722-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160224114630.6acadfea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Mon, 18 Jan 2016 17:44:13 +0300, Lada Trimasova wrote:
> ARC gcc understands "-pie" option and attempts to generate PIE
> binaries as of today PIE is not really supported for user-space
> applications.
> So we provide option which checks if compiler understands relro
> and pie options and disable PIE detection if building for ARC.
> Also AUTORECONF option should be added because of modified
> configure.in and Makefile.am files.
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> ---
> Changes v1 -> v2:
>  - Check if compiler understands PIE_CFLAGS and RELRO_LDFLAGS
> ---
>  ...ompiler-understands-pie-and-relro-options.patch | 215 +++++++++++++++++++++
>  package/trousers/trousers.mk                       |   9 +
>  2 files changed, 224 insertions(+)
>  create mode 100644 package/trousers/0002-Check-if-the-compiler-understands-pie-and-relro-options.patch

Applied to master, thanks. I've just changed the commit title to use
lowercase package name, i.e "trousers" instead of "Trousers".

Can you submit your patch to the upstream trousers developers?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
