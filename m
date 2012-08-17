From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 13:22:18 +0200
Subject: [Buildroot] [PATCH 10/36] package/spice-server: new package
In-Reply-To: <1344815664-28138-10-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-10-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120817132218.40c4d82d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 13 Aug 2012 01:53:58 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> --- /dev/null
> +++ b/package/spice/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_SPICE
> +	bool "spice server"
> +	depends on BR2_PACKAGE_PYTHON_PYPARSING

This should probably be:

	depends on BR2_PACKAGE_PYTHON
	select BR2_PACKAGE_PYTHON_PYPARSING

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
