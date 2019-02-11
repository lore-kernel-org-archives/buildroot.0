From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 15:36:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnp18: fix static linking
 with mpd
In-Reply-To: <20190208204656.27400-1-fontaine.fabrice@gmail.com>
References: <20190208204656.27400-1-fontaine.fabrice@gmail.com>
Message-ID: <20190211153655.58e34aab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Feb 2019 21:46:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add a call to PKG_CHECK_MODULES in configure.ac to get openssl
>   libraries and its dependencies if openssl support is enabled
> - Add OPENSSL_LIBS to libupnp.pc.in so that applications linking with
>   pupnp (such as mpd) will be able to retrieve openssl libraries
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a4148e516070b79816769f3443fc24d6d8192073
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-configure.ac-fix-build-with-openssl.patch | 51 ++++++++++++++++++++++
>  package/libupnp18/libupnp18.mk                     |  3 +-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
