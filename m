From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 10:45:24 +0100
Subject: [Buildroot] [PATCHv3 03/12] toolchain-external: clarify rsync
 excludes in copy_toolchain_sysroot
In-Reply-To: <CAAXf6LVTZqdXdZGcr+ni-Xr+zM05UmNDaFvsDdnE-mpRYua_3g@mail.gmail.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
 <20170207215649.364-4-patrickdepinguin@gmail.com>
 <36c567b1-c955-1ed8-aa35-20e97138281c@gmail.com>
 <CAAXf6LVTZqdXdZGcr+ni-Xr+zM05UmNDaFvsDdnE-mpRYua_3g@mail.gmail.com>
Message-ID: <20170208104524.26ea3b9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Feb 2017 10:22:14 +0100, Thomas De Schampheleire wrote:

> > With the current CodeSourcery NiosII toolchain, this change have a weird side
> > effect...
> >
> > If you look at "host/opt/ext-toolchain/nios2-linux-gnu/libc/usr/lib/", you will
> > find a directory named "libffi-3.2.1". This directory contain the libffi headers !?
> >
> > ls libffi-3.2.1/include
> > ffi.h  ffitarget.h
> >
> > So this directory is now present in STAGING_DIR:
> > ls staging/usr/lib/libffi-3.2.1
> >
> > I think it's a mistake in the toolchain itself...  
> 
> Yes, I think so too. It is very weird that headers would be placed in
> usr/lib/something. Are they also present elsewhere, like in
> usr/include ?
> 
> In any case, the fact that these files are now present in staging
> should not hurt. Also for target it will not make a difference.
> 
> Also, the fact that they used to be skipped with the original code is
> more of an accident, than actual intention.

Agreed. This is more a bug in the toolchain that anything else. We can
always add a custom toolchain hook to get rid of them. But since they
are only in staging, I don't think it's really worth the effort.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
