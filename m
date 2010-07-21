From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jul 2010 08:52:35 +0200
Subject: [Buildroot] Build failed with Error 1 and Error 2
In-Reply-To: <29222293.post@talk.nabble.com>
References: <29222293.post@talk.nabble.com>
Message-ID: <20100721085235.7f682c11@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jul 2010 23:23:50 -0700 (PDT)
JNY <jny0@hotmail.com> wrote:

> After many hours (around 4) of running, my buildroot ultimately
> failed with the following errors, any ideas?

Could you please post your .config ? Unless you've enabled dozens and
dozens of packages and have a slow machine, a build of four hours looks
a bit suspicious. If you're beginning with Buildroot, I would first
recommend you to build a basic system with just Busybox enabled, and
see how it works, before going on with building a more complicated
system.

> /home/JB/Apps/buildroot-2010.05/output/staging/usr/include/scsi/scsi.h:148:
> error: expected specifier-qualifier-list before 'u8'
> /home/JB/Apps/buildroot-2010.05/output/staging/usr/include/scsi/scsi.h:
> In function 'scsi_varlen_cdb_length':
> /home/JB/Apps/buildroot-2010.05/output/staging/usr/include/scsi/scsi.h:159:
> error: 'struct scsi_varlen_cdb_hdr' has no member named
> 'additional_cdb_length'

Yes, this is a breakage in the kernel headers. The
linux-*-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
patch didn't get applied to your kernel headers when building the
toolchain.

Can you please post your .config so that we know which version of the
kernel headers you're using ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
