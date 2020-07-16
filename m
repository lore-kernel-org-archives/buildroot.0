From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 23:29:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/lm-sensors: always pass
 TARGET_CONFIGURE_OPTS
In-Reply-To: <20200713093729.203008-1-fontaine.fabrice@gmail.com>
References: <20200713093729.203008-1-fontaine.fabrice@gmail.com>
Message-ID: <20200716232948.53b3c3fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 11:37:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> lm-sensors dropped MACHINE variable since version 3.6.0 and
> https://github.com/lm-sensors/lm-sensors/commit/0863eff8fa1d32797e3aec19672878aff893b0ae
> instead it uses $(CC) -dumpmachine to guess the architecture
> 
> However, as $(TARGET_CONFIGURE_OPTS) is only passed to build step and
> not to install steps, this result in some binaries being built for the
> host during install step and raising a build failure on some autobuilders
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0180989afdd9272ecd5010a787931e0b10a6cdcf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lm-sensors/lm-sensors.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
