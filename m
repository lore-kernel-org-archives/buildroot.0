From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:02:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/xerces: add enable network
 option
In-Reply-To: <20200504202558.24654-1-jared.bents@rockwellcollins.com>
References: <20200504202558.24654-1-jared.bents@rockwellcollins.com>
Message-ID: <20200509220251.0d1cd423@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 15:25:58 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> Update to add the option to compile xerces with network
> enabled by default so it can be unselected to compile
> without network support.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Could you expand the commit log with an explantion of the *why* we want
to add this new option? Size impact? If so, what is the size impact?
Some other reason?

> +ifeq ($(BR2_PACKAGE_XERCES_ENABLE_NETWORK),y)
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  XERCES_CONF_OPTS += -Dnetwork-accessor=curl
>  XERCES_DEPENDENCIES += libcurl
>  else
>  XERCES_CONF_OPTS += -Dnetwork-accessor=socket
>  endif
> +else
> +XERCES_CONF_OPTS += -Dnetwork:BOOL=OFF

We don't use this :BOOL type specification anywhere in CMake packages
in Buildroot, could you keep it consistent with the rest of the package?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
