From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:35:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/stellarium: new package
In-Reply-To: <20190806050445.23088-1-bernd.kuhls@t-online.de>
References: <20190806050445.23088-1-bernd.kuhls@t-online.de>
Message-ID: <20190806223558.53f7ee0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Aug 2019 07:04:45 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for this v2. I've applied with one change. See below.

> +comment "stellarium needs an OpenGL provider"
> +	depends on BR2_PACKAGE_QT5
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || \
> +		!BR2_PACKAGE_HAS_LIBGL

I changed this to:

+comment "stellarium needs Qt5 and an OpenGL provider"
+       depends on !BR2_PACKAGE_QT5 || !BR2_PACKAGE_HAS_LIBGL

which, IMO, is a bit more helpful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
