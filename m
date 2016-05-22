From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 22:44:47 +0200
Subject: [Buildroot] [PATCH] Add support GLES/EGL for odroidc2 broads
In-Reply-To: <trinity-ef9ecd45-f3e8-4e2e-9864-38a32d51531a-1463939159661@3capp-mailcom-bs03>
References: <trinity-ef9ecd45-f3e8-4e2e-9864-38a32d51531a-1463939159661@3capp-mailcom-bs03>
Message-ID: <20160522224447.6294f65a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 19:45:59 +0200, daggs wrote:

> the following patch adds GLES/EGL support for odroidc2 broads.
> this means that programs like kodi which needs ui can be run.

Thanks for this patch! Great to see some OpenGL enabling on ARM64.
However, could you:

 1/ Send your patch with git send-email so that the patch appears
    inline and not as an attachment, which allows us to do proper review
    of the patch.

 2/ Split the patches in multiple patches? You need to at least
    separate the following aspects:

    a/ odroid-mali package addition
    b/ kodi package changes
    c/ odroidc2 changes

Note that in the odroid-mali package, you use variables like
INSTALL_LIBS, INSTALL_HDRS, etc. This is not a good idea, since the
namespace of variables in Buildroot is global. Due to this, *all*
variables defined by a package must be prefixed by the name of the
package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
