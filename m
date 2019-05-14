From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:39:33 +0200
Subject: [Buildroot] [PATCH v2] package/ninja: enforce Python3 on the
 host
In-Reply-To: <20190513215337.10400-1-joerg.krause@embedded.rocks>
References: <20190513215337.10400-1-joerg.krause@embedded.rocks>
Message-ID: <20190514183933.6eba55fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 May 2019 23:53:37 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> The current logic selects Python3 for the host only if Python3 is
> selected for the target, otherwise it selects Python2.
> 
> As Meson, the only package infrastructure using ninja, needs Python3, it is
> desirable to also depend on Python3 on the host for the ninja host
> package.
> 
> Otherwise, if no Python interpreter is selected for the target, both
> Python2 and Python3 are build for the host, which is time consuming
> without any benefit.
> 
> For example when building libmpdclient (and all its target and host
> dependencies) the actual elapsed time for is reduced from around 286s to 207s
> as reported by `time -p make clean all`.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  * fix setting the dependency, as <pkg>_NEEDS_HOST_PYTHON
>    only makes sense for packages using the python-package infrastructure,
>    but Ninja is using the generic-package infrastructure (Thomas
>    Petazzoni)
> ---
>  package/ninja/ninja.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
