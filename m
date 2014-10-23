From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 22:16:36 +0200
Subject: [Buildroot] [PATCH] botan: fix mips64 build using n32 ABI
In-Reply-To: <301f9a581364fbaaf8f8ec7c2cde1d18241928c7.1414046088.git.baruch@tkos.co.il>
References: <301f9a581364fbaaf8f8ec7c2cde1d18241928c7.1414046088.git.baruch@tkos.co.il>
Message-ID: <20141023221636.64cee03d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 23 Oct 2014 09:34:48 +0300, Baruch Siach wrote:
> Remove explicit -mabi parameter, and let the external toolchain wrapper set
> the correct -mabi.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8fb/8fb8621bc5175f593de4ad0f005a5c7ffd4d9241/
> 
> Cc: Francois Perrad <fperrad@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/botan/0001-remove-mips64-explicit-mabi.patch | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/botan/0001-remove-mips64-explicit-mabi.patch

Applied, thanks. I really wonder why this botan build system decides to
pass its own -mabi rather than trusting the compiler and its
configuration to use the correct flags.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
