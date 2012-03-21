From: lexa <lexa@cfotr.com>
Date: Wed, 21 Mar 2012 13:26:07 +0400
Subject: [Buildroot] Using custom kernel headers instead toolchain
 headers
In-Reply-To: <201203192319.22728.arnout@mind.be>
References: <1332183352.6228.94.camel@desktop>
 <201203192319.22728.arnout@mind.be>
Message-ID: <1332321967.3685.13.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2012-03-19 at 23:19 +0100, Arnout Vandecappelle wrote:
> On Monday 19 March 2012 19:55:52 lexa wrote:
> 
> > I use buildroot-2012.02 with external toolchain named "Sourcery
> 
> > CodeBench ARM 2011.03". 
> 
> > 
> 
> > This toolchain contain linux headers, but i dont want to use them. I
> 
> > want to use header compiled from my kernel, is it possible ?
> 
>  
> 
> Short answer: no.
> 
>  
> 
> The kernel headers are used to compile the C library, which needs to
> 
> know which system calls exist, how various things are defined, and
> 
> sometimes which features exist. So using different kernel headers
> 
> for compiling other libraries or programs is a bad idea, because it
> 
> may lead to inconsistencies.
> 
>  
> 
> However, the kernel you compile doesn't need to be the same as the
> 
> toolchain's kernel headers. It just has to be newer. This is
> 
> possible because Linus makes sure that every Linux release is
> 
> ABI compatible with previous releases.
> 
>  
> 
>  
> 
> There is one reason why you may want to use different kernel headers
> 
> than the ones of the toolchain, and that's when you have a vendor
> 
> kernel that defines additional ioctl's used by device drivers that
> 
> are not (yet) upstreamed. In this case, you need access to your
> 
> vendor kernel's headers. AFAIK buildroot doesn't really support this
> 
> use case.
> 
>  
> 
> Regards,
> 
> Arnout
> 
>  

Thank you for this detailed explanation.

I use heavy patched kernel and i need use custom kernel headers. If i
choose using
buildroot toolchain, can buildroot create kernel-headers from my custom
kernel source and use this headers for build buildroot toolchain and
other binaries?

> 
> -- 
> 
> Arnout Vandecappelle arnout at mind be
> 
> Senior Embedded Software Architect +32-16-286540
> 
> Essensium/Mind http://www.mind.be
> 
> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
> 
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> 
> GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
>  
> 
