From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:27:06 +0200
Subject: [Buildroot] [PATCH 1/1] lshw: bump version to B.02.18
In-Reply-To: <1469811299-17096-1-git-send-email-hubert.sokolowski@intel.com>
References: <1469811299-17096-1-git-send-email-hubert.sokolowski@intel.com>
Message-ID: <20160730152706.674d3498@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 18:54:59 +0200, Hubert Sokolowski wrote:
> Version B.02.17 was found to be unstable on recent HW.
> Obsolete patches are removed for the following reasons:
> - 0001-add-LIBS.patch does not apply and needs to be
>   recreated if still needed, the patch was created in 2012
>   and since then it was not upstreamed to lshw repo.

The fact that the patch no longer applies or was created in 2012 is
clearly not a good enough justification. And in fact, this patch is
still needed, in order to pass extra values to the LIBS variable. This
is necessary when the libc doesn't have locale support, and libintl
provides the gettext functionality.

> - patches from git.alpinelinux.org are no longer available
>   on the server.

And? First, this is incorrect, they are still available, but at a
different location. And since they are available on our backup mirror
sources.buildroot.net, they are in fact still used. Those patches are
needed, otherwise lshw doesn't build with musl.

Fortunately, musl support has been merged upstream, so the new version
of lshw indeed builds fine with musl. So removing those two patches is
indeed the correct thing to do, but clearly not because of your
explanation.

So, I've applied your patch, after re-adding the LIBS patch, and
updating the commit log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
