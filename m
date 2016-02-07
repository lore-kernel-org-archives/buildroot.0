From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 19:25:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/boost: Disable fenv support
 with uClibc
In-Reply-To: <1454759480-27848-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454759480-27848-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207192509.4156f47f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  6 Feb 2016 12:51:20 +0100, Bernd Kuhls wrote:
> The boost build system does not recognize the fact that fenv.h is an
> optional module in uClibc and tries to use it even if UCLIBC_HAS_FENV
> is disabled. This patch disables fenv support completely when compiling
> with a uClibc-based toolchain.
> 
> Fixes
> http://autobuild.buildroot.net/results/160/160e1b98b204148ecf128144826554b6c523931b/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: updated patch to define BOOST_NO_FENV_H for the linux platform config
>     instead of patching the boost source directly


Thanks for this new version. However I still don't understand why the
boost tests that check for the availability of the different FE_*
defines don't work properly.

See libs/config/test/boost_no_fenv_h.ipp.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
