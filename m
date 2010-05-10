From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 May 2010 21:58:33 +0200
Subject: [Buildroot] [PATCH 6/9] linux-fusion: add dependency on
	!BR2_KERNEL_none
In-Reply-To: <c8617ac61f2728a706f305e3e971c1c3ad22ec8f.1273440344.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 9 May 2010 23:26:40 +0200")
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
	<cover.1273440344.git.thomas.petazzoni@free-electrons.com>
	<c8617ac61f2728a706f305e3e971c1c3ad22ec8f.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87tyqf4jh2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> linux-fusion is composed of a kernel module, and linux-fusion.mk uses
 Thomas> several variable definitions that only exist when Buildroot compiles a
 Thomas> kernel.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/linux-fusion/Config.in |    1 +
 Thomas>  1 files changed, 1 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
 Thomas> index 6fb5260..ebd00b4 100644
 Thomas> --- a/package/linux-fusion/Config.in
 Thomas> +++ b/package/linux-fusion/Config.in
 Thomas> @@ -1,4 +1,5 @@
 Thomas>  config BR2_PACKAGE_LINUX_FUSION
 Thomas> +	depends on !BR2_KERNEL_none

You should also make BR2_PACKAGE_DIRECTFB_MULTI depend on
BR2_KERNEL_none then.

-- 
Bye, Peter Korsgaard
