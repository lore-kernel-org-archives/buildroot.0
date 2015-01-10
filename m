From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 18:24:44 +0100
Subject: [Buildroot] [PATCH v2] qt: split script and webkit supported
 arches in two different variables
In-Reply-To: <1417712399-6394-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417712399-6394-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150110182444.3ede8a44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 4 Dec 2014 16:59:59 +0000, Vicente Olivert Riera wrote:
> Currently in Buildroot we have a BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> variable indicating which architectures support Qt Webkit. We also make
> Qt Script depending on that variable, so we are assuming that Qt Script
> is supported for exactly the same architectures which support Qt Webkit,
> and that's not true.
> 
> For instance, Qt Webkit is not supported for MIPS64 when
> using the n32 ABI, but Qt Script is actually supported. So, if we make
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT depending on !BR2_MIPS_NABI32 we
> will also disable Qt Script, because as I said before, Qt Script depends
> on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT, and we don't want that because
> Qt Script works.
> 
> We fix this by creating another variable called
> BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT to state which architectures support
> Qt Script, so now we can differentiate them from the ones supporting Qt
> Webkit.
> 
> Related:
>   http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
