From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 26 Jan 2015 09:54:11 +0100
Subject: [Buildroot] [PATCH 05/14 v6] package/mesa3d-headers: new package
In-Reply-To: <a7d0443926fdc7741ab70b454d6c893f7c7a0b5f.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
 <a7d0443926fdc7741ab70b454d6c893f7c7a0b5f.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <1491783.fYcJCMXy9W@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Saturday 24 January 2015 00:24:34 Yann E. MORIN wrote:
> Some headers required to build GL/EGL/GLES/... stuff are not provided by
> Khronos, so we must find an alternate source for those headers.
> Currently, we're missing:
>   - gl.h for full GL (gl.h for GLES is available from Khronos)
>   - dri_interface.h to be able to build GL-enabled Xorg
> 
> mesa3d provides all of them, and they are generic enough that they can
> be re-used even for other GL/EGL/GLES/... implementations.
> 
> Unfortunately, modifying mesa3d so that it only installs its headers is
> no trivial task, and would render the mesa3d package really ugly and
> unmaintainable in the long run.
Did you try "make install-data" in mesa3d tree? It should install all 
files but the libraries (in other terms, it install headers only).


> Instead, we introduce a stripped-down mesa3d-headers package, which sole
> purpose is to install those missing headers.
hmmm... since mesa3d-headers provide all headers, do we really need 
khronos-registry-* packages? In add, all developers test their code 
using mesa3d headers. So, I would prefer to use headers provided by 
mesa3d than khronos.

[...]

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
