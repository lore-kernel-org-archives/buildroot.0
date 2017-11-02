From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:09:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-networkmanager: Bump
 to version 2.0.1
In-Reply-To: <20171102210144.27993-1-petr.vorel@gmail.com>
References: <20171102210144.27993-1-petr.vorel@gmail.com>
Message-ID: <20171102220948.6a4e757b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 22:01:44 +0100, Petr Vorel wrote:
> Added new runtime dependency on python-six.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks for the respin.

> diff --git a/package/python-networkmanager/Config.in b/package/python-networkmanager/Config.in
> index fcbce5748d..c99f2c31ad 100644
> --- a/package/python-networkmanager/Config.in
> +++ b/package/python-networkmanager/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_NETWORKMANAGER
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
>  	depends on BR2_PACKAGE_DBUS # dbus-python
>  	select BR2_PACKAGE_DBUS_PYTHON
> +	select BR2_PACKAGE_PYTHON_SIX

So this one is really just a runtime dependency, as opposed to
dbus-python, which is a build time dependency. Correct?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
