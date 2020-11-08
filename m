From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 8 Nov 2020 12:47:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-05
In-Reply-To: <5f7c1855.1c69fb81.4e07d.9852SMTPIN_ADDED_MISSING@mx.google.com>
References: <5f7c1855.1c69fb81.4e07d.9852SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <b1e92f42-3eb6-04e9-32cb-d049f0acb8f2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 06/10/2020 ? 09:10, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
> 
> Results for the 'master' branch
> -------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arm      | piglit-2affee53f3ad7a96f5b3... | http://autobuild.buildroot.net/results/76212834a3065c4c3d479a49a16297d4679098a0
> 
> 

We have time to time this kind of build issue when the EGL provider is not mesa.

[BR2_PACKAGE_PROVIDES_LIBEGL="sunxi-mali-mainline"]:
http://autobuild.buildroot.net/results/76212834a3065c4c3d479a49a16297d4679098a0

[BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"]:
http://autobuild.buildroot.net/results/2cb799919d47e57eb401b7ece00b65707f9bd3ec

Even if piglit could be used to test any opengl implementation, it's really a
mesa's project because it follow closely the mesa implementation.

Other opengl vendor (binary blob) are quickly out of date and incompatible with
piglit.

I would suggest to add a dependency to piglit package to use only mesa3d as
opengl provider.

Thoughts ?

Best regards,
Romain
