From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:59:20 +0200
Subject: [Buildroot] [PATCH v14 4/5] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <20191021200438.97453-5-aduskett@gmail.com>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-5-aduskett@gmail.com>
Message-ID: <20191022225920.7e35e42e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 13:04:37 -0700
aduskett at gmail.com wrote:

> +	_PYTHON_SYSCONFIGDATA_NAME="$$(if $$(BR2_PACKAGE_PYTHON3),$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)" \

Why do we need this conditional on BR2_PACKAGE_PYTHON3 ?
package/pkg-python.mk is using PKG_PYTHON_SYSCONFIGDATA_NAME
unconditionally, regardless of Python 2.x vs. Python 3.x. Could you
explain this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
