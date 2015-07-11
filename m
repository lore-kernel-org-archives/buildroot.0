From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 16:39:18 +0200
Subject: [Buildroot] [PATCH 1/1] python-cython: new package for host only
In-Reply-To: <1432821467-19253-1-git-send-email-pbouda@cidles.eu>
References: <1432821467-19253-1-git-send-email-pbouda@cidles.eu>
Message-ID: <20150711163918.76ae5d35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Bouda,

On Thu, 28 May 2015 14:57:47 +0100, Peter Bouda wrote:
> This patch adds an .mk file for Cython. The package is host-only, as
> it is a dependency to pre-process Cython code on the host and
> is not needed as Python package on the target. It was tested
> with Python packages that require Cython. Packages that require it
> can then just use:
> 
> PYTHON_FOO_DEPENDENCIES = host-python-cython
> 
> Signed-off-by: Peter Bouda <pbouda@cidles.eu>
> ---
>  package/python-cython/python-cython.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 package/python-cython/python-cython.mk

Thanks for this contribution. It seems potentially useful, but we
generally merge new host packages only when there is a target package
that also needs them.

Could you resubmit this as a patch series that also adds a target
package that needs this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
