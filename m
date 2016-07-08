From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 18:36:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsepol: Remove use of cdefs.h
In-Reply-To: <1467990214-30905-1-git-send-email-Aduskett@gmail.com>
References: <1467990214-30905-1-git-send-email-Aduskett@gmail.com>
Message-ID: <20160708183606.615035cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Jul 2016 11:03:34 -0400, Adam Duskett wrote:
>  Libsepol uses cdefs.h which is a internal glibc header. 
>  This header is not intended to be used by any program and will cause 
>  compiling against musl (and possibly other c libraries) to fail.    
>  This patch fixed this issue and replaces all references of
>  #include <sys/cdefs.h> and __BEGIN/END_DECLS with the appropriate #ifdefs.

Please include a reference to the autobuilder issue being fixed. Like:

Fixes:

   http://autobuild.buildroot.org/results/..../

> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libsepol/0005-replace-cdefs.patch | 1059 +++++++++++++++++++++++++++++
>  1 file changed, 1059 insertions(+)
>  create mode 100644 package/libsepol/0005-replace-cdefs.patch
> 
> diff --git a/package/libsepol/0005-replace-cdefs.patch b/package/libsepol/0005-replace-cdefs.patch
> new file mode 100644
> index 0000000..e9da24f

We need a description + Signed-off-by inside the patch itself. See
other patches in Buildroot, and the Buildroot manual for details.
Please indicate in the patch description that it has been submitted
upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
