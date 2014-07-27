From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:10:37 +0200
Subject: [Buildroot] [PATCH 0/2] systemd: bump to version 215
In-Reply-To: <87vbqjaiz8.fsf@dell.be.48ers.dk>
References: <1406302301-9382-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140726091600.6dc09661@free-electrons.com>
 <87vbqjaiz8.fsf@dell.be.48ers.dk>
Message-ID: <20140727101037.694c5808@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 26 Jul 2014 23:49:31 +0200, Peter Korsgaard wrote:

>  >> - a bump of the systemd package to version 215.
>  >> - a patch to disable the ldconfig.service unit, installed by v215 (this unit
>  >> would fail, as /sbin/ldconfig is not installed in a target generated using
>  >> a glibc-based toolchain).
> 
>  > Thanks, I've applied both patches. However, for the second one, I
>  > consider it as a temporary solution. We should really fix the ldconfig
>  > handling in Buildroot.
> 
> What exactly needs fixing? Runtime ldconfig doesn't make much sense if
> E.G. the rootfs is read only.

Right. But at least we might want to have a mechanism to generate at
build time, the ld.so.cache, no? But indeed, having it at runtime would
be kind of useless.

The other thing that needs fixing is the code in the main Makefile that
runs the host ldconfig for the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
