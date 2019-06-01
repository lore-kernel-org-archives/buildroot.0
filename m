From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 11:24:56 +0200
Subject: [Buildroot] [PATCH for-next 3/3] package/ogre: new package
In-Reply-To: <20190529151655.7098-3-romain.naour@gmail.com>
References: <20190529151655.7098-1-romain.naour@gmail.com>
 <20190529151655.7098-3-romain.naour@gmail.com>
Message-ID: <20190601112456.50402535@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Wed, 29 May 2019 17:16:55 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> +OGRE_VERSION = 1.12.0
> +OGRE_SITE = $(call github,OGRECave,ogre,v$(OGRE_VERSION))
> +OGRE_LICENSE = MIT with exceptions (main library), MIT (DeferredShadingMedia samples), Public Domain (samples and plugins), Zlib (tinyxml)

Could you comment a bit on where you found those license terms ? The
LICENSE file only contains the normal MIT license text. Just picking a
random file (OgreFileSystem.cpp) from the main library shows just the
regular MIT license (I don't see any exception).

PlugIns/CgProgramManager/src/OgreCgPlugin.cpp which is a plugin, shows
a MIT license.

Could you perhaps add a comment above this line that justifies this
licensing description ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
