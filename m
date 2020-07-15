From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:38:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: disable
 introspection
In-Reply-To: <20200715203442.956892-1-fontaine.fabrice@gmail.com>
References: <20200715203442.956892-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715233854.3e78c5d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 22:34:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build will fail if gobject-introspection is built before network-manager
> but python-gobject is not:
> 
> configure: error: "--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)
> 
> To avoid this build failure and because we don't need documentation,
> just disable introspection
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d3b1bc2fa7559e66465033c455176761d6e184d1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/network-manager/network-manager.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
