From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Oct 2012 13:07:45 +0200
Subject: [Buildroot] BuildRoot not starting with Udev
In-Reply-To: <CA+mmYj1=cP3p24SnQ3HsRxQUo_gJBQidGXv5EiVKZc2D7kfjZQ@mail.gmail.com>
References: <loom.20121015T104727-737@post.gmane.org>
 <20121016194117.2ed3a609@skate>
 <CA+mmYj1=cP3p24SnQ3HsRxQUo_gJBQidGXv5EiVKZc2D7kfjZQ@mail.gmail.com>
Message-ID: <507E9181.5060000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/12 13:03, Antoine Caurier wrote:
> I found one of your previous post, where you said that if kernel was
> build by buildroot, it should be ok. So I was thinking that it should
> be ok just activating udev as I am building kernel with buildroot.
>
> I tried to manually set DEVTMPFS in linux-menuconfig, and then
> recompile the kernel (with buildroot), and it is now working.
>
> Is it normal to have manualy to set DEVTMPFS in kernel configuration
> in order to have udev working?

  The DEVTMPFS is set automatically by buildroot - but only when configuring
the kernel.  Once your kernel is configured, it's not touched again.

  So you'd have to run 'make linux-reconfigure' to get the devtmpfs (note that
you also loose your local modifications that way, unless you saved them to
a custom defconfig).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
