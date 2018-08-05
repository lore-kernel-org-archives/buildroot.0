From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:39:14 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: needs host-python2
In-Reply-To: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
References: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
Message-ID: <20180805143914.7548ed45@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 23:43:26 +0200, Fabrice Fontaine wrote:
> gnuradio needs host-python2 however there is no way to enforce this so
> add a dependency on !BR2_PACKAGE_PYTHON3.
> Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
> build host-python3.
> This issue was not raised in the previous version of gnuradio as
> host-python-cheetah was the only dependency and host-python-cheetah
> enforces python2 through HOST_PYTHON_CHEETAH_NEEDS_HOST_PYTHON however
> we now have host-python-six and host-python-mako dependencies and it
> does not seem right to enforces python2 on those packages
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a502fef3e2a40f38ca63332440b0b6bd2ed11d5a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
