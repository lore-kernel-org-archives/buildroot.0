From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 22:54:06 +0100
Subject: [Buildroot] [git commit] qemu: fix build when python3 is enabled
In-Reply-To: <20141103214423.CD179B175C@busybox.osuosl.org>
References: <20141103214423.CD179B175C@busybox.osuosl.org>
Message-ID: <5457F97E.7050509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 22:37, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=1d21e4c397cbd92d03d09daf4fadffaa79959f55
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes:
> http://autobuild.buildroot.net/results/04e/04ec455e352319a46dc06def1762c65ad28a12a1/
> http://autobuild.buildroot.net/results/f19/f1932657912674af444602ac59211b6caf6841ca/
> http://autobuild.buildroot.net/results/18a/18a43df80616280506a44ac3abc327ddf0e7b079/
> http://autobuild.buildroot.net/results/44c/44c00b50248018c4e81f4fbb1041d35b78f89640/
> 
> And many others.
> 
> When python3 for the target is enabled, $(HOST_DIR)/usr/bin/python points to
> host-python3, not host-python - Breaking the build. Ensure host-python is used.

 There's another potential issue like this in dbus-python, in python-pypcap and
in samba4.


 Regards,
 Arnout

> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/qemu/qemu.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 4b8f0f4..8182697 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -96,7 +96,7 @@ QEMU_OPTS =
>  
>  QEMU_VARS = \
>  	LIBTOOL=$(HOST_DIR)/usr/bin/libtool \
> -	PYTHON=$(HOST_DIR)/usr/bin/python \
> +	PYTHON=$(HOST_DIR)/usr/bin/python2 \
>  	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
>  
>  ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
