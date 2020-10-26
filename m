From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:08:41 +0100
Subject: [Buildroot] [PATCH v3,2/2] package/zeek: new package
In-Reply-To: <20201025161246.1622486-2-fontaine.fabrice@gmail.com>
References: <20201025161246.1622486-1-fontaine.fabrice@gmail.com>
 <20201025161246.1622486-2-fontaine.fabrice@gmail.com>
Message-ID: <20201026220841.085177d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 25 Oct 2020 17:12:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ZEEK_CONF_OPTS = \
> +	-DBIFCL_EXE_PATH=$(HOST_DIR)/bin/bifcl \
> +	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
> +	-DBROKER_DISABLE_DOCS=ON \
> +	-DBROKER_DISABLE_TESTS=ON \
> +	-DINSTALL_AUX_TOOLS=ON \
> +	-DZEEK_ETC_INSTALL_DIR=/etc
> +
> +define ZEEK_FIX_PYTHON_PATH
> +	$(SED) 's, at PYTHON_EXECUTABLE@,/usr/bin/python,' \
> +		$(@D)/auxil/zeekctl/ZeekControl/ssh_runner.py
> +endef
> +
> +ZEEK_POST_CONFIGURE_HOOKS += ZEEK_FIX_PYTHON_PATH

Does this needs to be a post-configure hook ? Isn't that needed simply
after the installation ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
