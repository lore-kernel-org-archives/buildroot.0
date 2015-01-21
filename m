From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 21 Jan 2015 10:06:07 +0100
Subject: [Buildroot] [PATCH 02/11 v5] package/khrplatform-registry: new
	package
In-Reply-To: <e54ab4506debce9d07fda2797b739c6d20d34d3d.1421699898.git.yann.morin.1998@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <e54ab4506debce9d07fda2797b739c6d20d34d3d.1421699898.git.yann.morin.1998@free.fr>
Message-ID: <2749165.eXeClDSXxM@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Monday 19 January 2015 21:40:32 Yann E. MORIN wrote:
> Khronos is the group behind OpenGL and its siblings, OpenMAX and all
> other Open-something.
> 
> Khronos maintains the Registry, in which the reference headers for the
> different Open-something are maintained.
> 
> khrplatform is the header used by most other Khronos headers.
> 
> Note: there is no version for that file, so we rely on the hash to
> decide whether we have to re-download it or not. That's unfortunate,
> however, as an old build will not be reproducible in the future... :-(
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/opengl/Config.in                           |  3 +++
>  package/opengl/khronos-registry/Config.in          |  1 +
>  .../opengl/khronos-registry/khronos-registry.mk    |  1 +
>  .../khrplatform-registry/Config.in                 |  7 ++++++
>  .../khrplatform-registry/khrplatform-registry.hash |  2 ++
>  .../khrplatform-registry/khrplatform-registry.mk   | 25 ++++++++++++++++++++++
>  6 files changed, 39 insertions(+)
>  create mode 100644 package/opengl/khronos-registry/Config.in
>  create mode 100644 package/opengl/khronos-registry/khronos-registry.mk
>  create mode 100644 package/opengl/khronos-registry/khrplatform-registry/Config.in
>  create mode 100644 package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.hash
>  create mode 100644 package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.mk
Until now, there are no packages two levels of subdirectories (ie. 
packages/1/2/real_package). IMHO, it would be better to place
'khronos-registry' directly in 'package'.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
