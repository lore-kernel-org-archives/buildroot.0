From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 21 Apr 2014 13:29:14 +0000
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <20140421135807.3002c46f@skate>
References: <20140421063009.036D5100FF4@stock.ovh.net>
 <20140421114949.59c65c31@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356CB9EA2@de02wembxa.internal.synopsys.com>
 <20140421135807.3002c46f@skate>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356CB9F10@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile.in of openswan contains -fPIE hardcoded . I suppose that is for the "security reasons", because this packages is IPsec implementation. I'm not a security expert, so I'm not sure how much PIE is important here. I would say that it is not much of the use to apply randomization to selected package, while leaving the rest of software on the same system without randomization.

Anton


> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 21 April 2014 15:58
> To: Anton Kolesov
> Cc: buildroot at uclibc.org; Alexey Brodkin; Vineet Gupta
> Subject: Re: Analysis of build results for 2014-04-20
> 
> Dear Anton Kolesov,
> 
> On Mon, 21 Apr 2014 10:18:53 +0000, Anton Kolesov wrote:
> 
> > [AK:] This is a limitation of ARC uClibc port: our crt1.o doesn't support PIE
> (though it seems simple hello world can be compiled). Our uClibc developer
> (added to CC) is going to fix this in near future, but he has a lot of other tasks
> to do right now, so this might not happen immediately.
> 
> Why do we need a PIE executable here? As far as I understand, PIC is
> mandatory for shared libraries, but PIE for executables is only needed
> for security reasons, if you want to randomize the location of
> executables in memory, at least in MMU-capable platforms.
> 
> So maybe we should just cook a patch to remove -fPIE when building
> openswan ? I don't think we build any other package with -fPIE, so why
> should openswan be different ?
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
