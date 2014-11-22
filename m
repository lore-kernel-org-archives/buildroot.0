From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:23:47 +0100
Subject: [Buildroot] [PATCH] python-netifaces: allow depending on Python
 3
In-Reply-To: <1416497530-3035-1-git-send-email-simon.marchi@polymtl.ca>
References: <1416497530-3035-1-git-send-email-simon.marchi@polymtl.ca>
Message-ID: <20141122192347.3cb69aa3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Marchi,

On Thu, 20 Nov 2014 10:32:10 -0500, Simon Marchi wrote:
> Version 0.10.4 is compatible with python 3.
> 
> Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
> ---
>  package/python-netifaces/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
> index 29f9fc3..b660fdb 100644
> --- a/package/python-netifaces/Config.in
> +++ b/package/python-netifaces/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PYTHON_NETIFACES
>  	bool "python-netifaces"
> -	depends on BR2_PACKAGE_PYTHON
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

This is no longer necessary. Since commit
http://git.buildroot.net/buildroot/commit/?h=next&id=cd331c1e1d15e7832f6eebc5c1e9c0a2dd34f033,
we have decided that for packages that support both python and python3,
it was not needed to have a dependency anymore, since this dependency
is already in package/Config.in.

Patch applied to the next branch, with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
