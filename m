From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:08:17 +0100
Subject: [Buildroot] Kernel patches in Buildroot
In-Reply-To: <564B603B.5010907@synopsys.com>
References: <56432809.3000902@synopsys.com> <56432ED3.7070008@mind.be>
 <564B0BBE.8050102@synopsys.com> <564B603B.5010907@synopsys.com>
Message-ID: <20151117210817.26557c68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Pinto,

On Tue, 17 Nov 2015 17:13:31 +0000, Joao Pinto wrote:

> BR2_GLOBAL_PATCH_DIR="snps-custom/packages"
> 
> I have a "snps-custom" folder which has a "packages" folder inside. Inside the
> "packages" folder we have a folder for each package we need to patch, in this
> example mplayer and the linux kernel.
> 
> --snps-custom
>   --packages
>     --linux-arc-axs101-20141021-3.13

Call this folder just "linux". The folder must be named after the
package name, and not contains some additional version information. If
you want to store patches for several versions of the same package, you
must use the same organization as in Buildroot itself:

  <package-name>/<package-version>/*.patch

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
