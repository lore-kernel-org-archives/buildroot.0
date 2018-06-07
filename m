From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 10:26:46 +0200
Subject: [Buildroot] Cannot build C++ internal toolchain using uclibc-ng
In-Reply-To: <CAPa8UMe7aWfRX+gRg=TawdqRaLj3CDee-gJ6Cn0w2aVdE9BkZA@mail.gmail.com>
References: <CAPa8UMePbuAEUCFMvYadN+n-zJN2c-N6B9RXL==BffbDLqww9g@mail.gmail.com>
 <20180606204952.58f73809@windsurf>
 <CAPa8UMezPR1Wuh43Pbt_RAVXFmRCCDRu=Yn1V4s-YpdE2fLA-g@mail.gmail.com>
 <20180606231532.5982164d@windsurf>
 <CAPa8UMe7aWfRX+gRg=TawdqRaLj3CDee-gJ6Cn0w2aVdE9BkZA@mail.gmail.com>
Message-ID: <20180607102646.0a6ab073@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jun 2018 23:24:06 +0200, Michele Bucca wrote:

> >> make clean
> >> LC_ALL=C make
> >>
> >> [1] https://pastebin.com/Z6vUVmRE
> >>  
> >
> > What Linux distribution and version of this distribution are you using
> > as the host system ?  
> 
> My host system is Debian Jessie 8.10 x86_64 Updated just today with
> latest packages from the repos

I built your exact defconfig in a Docker container that has Debian
Jessie 8.10 installed, and it worked just fine for me. I only had an
issue way after the toolchain build, when building the kernel, because
your defconfig lacks:

  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

But other than that, it builds fine. So I suspect there is something
wrong/special in your environment. As I can't reproduce, you'll have to
investigate a bit yourself I'm afraid.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
