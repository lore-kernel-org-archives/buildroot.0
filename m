From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:04:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-matplotlib: new package
In-Reply-To: <1557417530-25084-3-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557417530-25084-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557417530-25084-3-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20190601150457.240a9226@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jugurtha,

I am a bit late to the party since your patch has been applied, but I
found something odd, see below.

On Thu,  9 May 2019 17:58:50 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:


> +	select BR2_PACKAGE_PYTHON_CYCLER

Why isn't this one a runtime dependency ?

> +PYTHON_MATPLOTLIB_DEPENDENCIES = freetype host-python-numpy \
> +	libpng python-cycler

I dropped python-cycler from <pkg>_DEPENDENCIES, and then did a build
with "make python-matplotlib", so it only built the build time
dependencies and not the runtime dependencies, and it built just fine.

Could you comment on why you think python-cycler for the target would
be needed here ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
