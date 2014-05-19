From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 19 May 2014 10:03:33 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-16
In-Reply-To: <20140519115155.10e652cd@free-electrons.com>
References: <20140517063007.AED55100CC0@stock.ovh.net>
 <20140517093546.6b5dfca1@free-electrons.com>
 <39A54937CC95F24AA2F794E2D2B66B1356CCD708@de02wembxa.internal.synopsys.com>
 <20140519115155.10e652cd@free-electrons.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356CCD760@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 19 May 2014 13:52
> To: Anton Kolesov
> Cc: buildroot at uclibc.org; Alexey Brodkin
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-16
> 
> Dear Anton Kolesov,
> 
> (Would be nice to wrap your e-mails to a reasonable line length)
> 
> On Mon, 19 May 2014 09:46:36 +0000, Anton Kolesov wrote:
> 
> > > Missing some compiler intrinsics. I'll send a patch to disable jack2 on
> > > ARC for now.
> >
> > We have added an implementation for those intrinsics in the latest release
> of GCC, however they are disabled by default, because they require optional
> hardware features. User can enable those intrinsics with compiler flag -
> matomic, in case of Buildroot by adding it to the
> "BR2_TARGET_OPTIMIZATION", if they know that required HW is present. Is
> it possible to add -matomic to TARGET_OPTIMIZATION in autobuilder by
> default? There is a lot of packages that depend on atomic intrinsics, so
> enabling them would be useful for autobuilder, but I don't want to do this for
> the whole toolchain by default because users without required hardware
> support will get "illegal instruction" exception only in runtime.
> 
> I'd prefer to have an option under "Target options" to allow the user
> to define whether his hardware has the required optional features to
> provide the intrinsics. Something such as BR2_ARC_HAS_<feature>. Then
> packages can do:
> 
> 	depends on !(BR2_arc && !BR2_ARC_HAS_<feature>)
> 
> or something like that (my boolean algebra might be rusty on this
> Monday morning).


Ok, will do that.


> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
