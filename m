From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Mar 2015 20:40:03 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
Message-ID: <trinity-2a19cf41-f081-4123-a978-ca29ae5d3ed0-1426534803053@3capp-gmx-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, Mar 15, 2015 at 07:47:53PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Tue, 10 Mar 2015 20:59:39 +0100, Peter Seiderer wrote:
> 
> > +# unsupported platform, overwrite manually
> > +ifeq ($(BR2_bfin),y)
> > +POSTGRESQL_CONF_OPTS += --with-template=linux
> > +endif
> 
> Do we really need to make this conditional? I believe
> --with-template=linux is fine in all cases since Buildroot only targets
> Linux.
> 

Did take a look at postgresql-9.4.1/configure.in, the decision is made on
a variable called $host_os, but used for (what I would call) $target_os:

- for the bfin test case:
checking build system type... x86_64-unknown-linux-gnu
checking host system type... bfin-buildroot-uclinux-uclibc

- for a buildroot toolchain:
checking build system type... x86_64-unknown-linux-gnu
checking host system type... arm-buildroot-linux-uclibcgnueabi

> So what about having --with-template=linux unconditionally in
> POSTGRESQL_CONF_OPTS instead?
> 

Yes, I think this is save...

> If that's OK for you, I can adjust this when applying.
>

Yes, thats fine with me...

Regards,
Peter
 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
