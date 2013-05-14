From: john <john.osullivan@cloudiumsystems.com>
Date: Tue, 14 May 2013 10:51:57 +0100
Subject: [Buildroot] Using Buildroot tool chain as external Toolchain
In-Reply-To: <20130514112516.7ed42f44@skate>
References: <1368522484.2434.45.camel@john-ubu> <20130514112516.7ed42f44@skate>
Message-ID: <1368525117.2434.50.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for the reply.
I have attached the config.log

On Tue, 2013-05-14 at 11:25 +0200, Thomas Petazzoni wrote:
> Dear john,
> 
> On Tue, 14 May 2013 10:08:04 +0100, john wrote:
> 
> > I followed this process:
> > 1. I downloaded a copy of buildroot-2012.05
> > 2. Configured it and built it for my system
> > 3. Confirmed that everything built and ran sucessfully
> > 4. Copied the contents of buildroot-2012.05/output/host/usr
> > to /apps/buildroot_toolchain/usr
> 
> This doesn't work. By default, gcc is linked dynamically against mpc,
> mpfr and al, and that doesn't work nicely if you move things around.
> 
> Two choices:
> 
>  *) Build mpc and mpfr statically, so that gcc is linked statically
>     against them. Ideally, we should allow them to be built
>     dynamically, but gcc/binutils have binaries in multiple locations
>     in the tree, so we can't use the $ORIGIN/../lib trick to support a
>     relocatable rpath.
> 
>  *) Set BR2_HOST_DIR directly to /apps/buildroot_toolchain/ so that
>     your toolchain gets built and installed directly in this location.
> 
> > arm-linux-gcc... /home/xxx/xxx/xxx/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> > checking whether the C compiler works... no
> > configure: error: in
> > `/home/xxx/xxx/xxx/buildroot-2012.05/output/build/alsa-lib-1.0.25':
> > configure: error: C compiler cannot create executables
> > See `config.log' for more details
> > make: ***
> > [/home/xxx/xxx/xxx/buildroot-2012.05/output/build/alsa-lib-1.0.25/.stamp_configured]
> > Error 77
> 
> See output/build/alsa-lib-1.0.25/config.log for the details of the
> error; Would be useful to have this information to confirm that my
> analysis above is correct.
> 
> Thanks,
> 
> Thomas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 14572 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130514/14e14f5b/attachment.bin>
