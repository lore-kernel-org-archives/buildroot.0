From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:25:13 +0200
Subject: [Buildroot] [PATCH 2/3] python-service-identity: add missing
 BR2_INSTALL_LIBSTDCPP dependency
In-Reply-To: <1463521199-13662-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463521199-13662-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160524172513.7ad258bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 23:39:58 +0200, Thomas Petazzoni wrote:

> diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
> index e2200f6..ee6ca4a 100644
> --- a/package/python-service-identity/Config.in
> +++ b/package/python-service-identity/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>  	select BR2_PACKAGE_PYTHON_PYASN # runtime
>  	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
>  	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> +	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
>  	help
>  	  Service identity verification for pyOpenSSL.
>  

I forgot to add the Config.in comment for this dependency. So I've
added it, and applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
