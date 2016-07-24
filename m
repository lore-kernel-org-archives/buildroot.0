From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:45:09 +0200
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build
 when libseccomp is enabled.
In-Reply-To: <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160724164509.4cd1df61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 20:39:36 +0200, Romain Naour wrote:
> When BR2_PACKAGE_LIBSECCOMP is set, the go build system will try to
> find static library libseccomp.a since "static_build" and
> "extldflags '-static'" are used.
> 
> Link runc statically only for static only build and prefer dynamic
> linking otherwise.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Christian Stewart <christian@paral.in>

I have just sent a patch series that passes -static only when
BR2_STATIC_LIBS=y:

http://patchwork.ozlabs.org/patch/652100/
http://patchwork.ozlabs.org/patch/652101/
http://patchwork.ozlabs.org/patch/652102/

So I've marked this patch as superseded.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
