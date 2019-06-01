From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 2 Jun 2019 00:00:31 +0200
Subject: [Buildroot] [PATCH for-next 3/3] package/ogre: new package
In-Reply-To: <20190601112456.50402535@windsurf>
References: <20190529151655.7098-1-romain.naour@gmail.com>
 <20190529151655.7098-3-romain.naour@gmail.com>
 <20190601112456.50402535@windsurf>
Message-ID: <9effd48a-cbec-5079-4c14-8ecea6a3addc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/06/2019 ? 11:24, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Wed, 29 May 2019 17:16:55 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> +OGRE_VERSION = 1.12.0
>> +OGRE_SITE = $(call github,OGRECave,ogre,v$(OGRE_VERSION))
>> +OGRE_LICENSE = MIT with exceptions (main library), MIT (DeferredShadingMedia samples), Public Domain (samples and plugins), Zlib (tinyxml)
> 
> Could you comment a bit on where you found those license terms ? The
> LICENSE file only contains the normal MIT license text. Just picking a
> random file (OgreFileSystem.cpp) from the main library shows just the
> regular MIT license (I don't see any exception).

For Licensing hints, I'm using Fedora or Archlinux packaging as initial base:
https://apps.fedoraproject.org/packages/ogre/sources (see spec tab)
https://aur.archlinux.org/packages/ogre-1.9 (custom:MIT)
But it correspond to the 1.9 version of ogre, Fedora and Arch seems to be stuck
with these versions due to an API break with ogre >= 1.10. (for example,
stuntrally needs ogre <= 1.9)

Archlinux has a package for ogre 1.12 which is only MIT
https://aur.archlinux.org/packages/ogre3d/

But ogre include tinyxml library (Zlib)
Tools/XMLConverter/src/tinyxml.cpp

And 2 plugings that use a dual license MIT or Public Domain.
PlugIns/STBICodec/src/stbi/stb_image.h
PlugIns/STBICodec/src/stbi/stb_image_write.h

> 
> PlugIns/CgProgramManager/src/OgreCgPlugin.cpp which is a plugin, shows
> a MIT license.
> 
> Could you perhaps add a comment above this line that justifies this
> licensing description ?

I believe the "with exceptions" come from the switch from LGPLv2+ with
exceptions to MIT in the Fedora packaging.
https://src.fedoraproject.org/rpms/ogre/c/d9206dd427f9e42082160fa80a2023cd8250a4f3?branch=master

So it ogre use a MIT license but we should add a Zlib license for tinyxml.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
