From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 09:46:24 +0200
Subject: [Buildroot] [PATCH 1/1] Add libselinux and libsepol dependency
 for SELinux support.
In-Reply-To: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
References: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
Message-ID: <20160624094624.3fcf1575@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The title should always contain the package being affected by the
change. I.e, it should be of the form:

	<package>: <description>

In your case:

	busybox: ...

On Thu, 23 Jun 2016 22:43:16 -0400, Adam Duskett wrote:

>  config BR2_PACKAGE_BUSYBOX_SELINUX
> -	select BR2_PACKAGE_LIBSELINUX
> +	depends on BR2_PACKAGE_LIBSELINUX

Why are you doing this? A select is what's appropriate.

> +	depends on BR2_PACKAGE_LIBSEPOL

Why are you adding this? libselinux already selects libsepol, so when
you have libselinux, you have libsepol.

Therefore, this patch looks bogus :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
