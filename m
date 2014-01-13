From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jan 2014 16:10:12 +0800
Subject: [Buildroot] [PATCH v2] rt-tests: disable NPTL is missing
In-Reply-To: <0255f67e72bc626106163b3cfb821a68d99970fd.1389596187.git.baruch@tkos.co.il>
References: <0255f67e72bc626106163b3cfb821a68d99970fd.1389596187.git.baruch@tkos.co.il>
Message-ID: <20140113161012.06535faf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 13 Jan 2014 08:56:27 +0200, Baruch Siach wrote:

> +	# priority-inheritance mutex needs NPTL
> +	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD

No, these symbols are specific to the internal toolchain backend, and
do not make sense for external toolchains. Therefore, they shouldn't be
used for package dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
