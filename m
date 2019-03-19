From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:34:22 +0100
Subject: [Buildroot] [PATCH v1] package/meson: bump version to 0.50.0
In-Reply-To: <20190318214324.5479-1-ps.report@gmx.net>
References: <20190318214324.5479-1-ps.report@gmx.net>
Message-ID: <20190319223422.64ba1be0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, 18 Mar 2019 22:43:24 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I think this change broke the build of at-spi2-core:

  http://autobuild.buildroot.net/?reason=at-spi2-core-2.28.0

it is using meson, and it started failing to build on March 19, i.e not
long after I merged the meson bump. The log also says:

WARNING: Project targetting '>= 0.40.1' but tried to use feature introduced in '0.50.0': install arg in configure_file
Configuring atspi-2.pc using configuration

atspi/meson.build:60:0: ERROR: Subdir keyword must not be an absolute path.

I think we need to backport
https://github.com/GNOME/at-spi2-core/commit/44a812ea51223d82f21a098a2d45fcc5c329ce7a.patch
from upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
