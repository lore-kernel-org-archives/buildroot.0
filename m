From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 23:18:02 +0100
Subject: [Buildroot] [PATCH 1/3] xtables-addons: new package
In-Reply-To: <544831DD.70608@zacarias.com.ar>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
 <5447E6E5.10904@mind.be> <544831DD.70608@zacarias.com.ar>
Message-ID: <5450161A.3010102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/10/14 00:38, Gustavo Zacarias wrote:
> On 10/22/2014 02:18 PM, Arnout Vandecappelle wrote:
>
> >> +comment "xtables-addons needs a Linux kernel to be built"
> >> +    depends on !BR2_LINUX_KERNEL
> >> +
> >> +comment "xtables-addons needs a toolchain w/ dynamic library, largefile,
> threads"
> >> +    depends on BR2_LINUX_KERNEL
> >
> >  Do we usually do this? I mean, if a user discovers the 'needs a Linux kernel'
> > comment and builds a kernel, then he comes back only to discover that he still
> > has to enable all this other stuff...
>
> I can move it to linux extensions instead of it being a package, i don't
> know if it's worth bloating too much there.

 No, that's not what I meant: linux extensions are for things that modify
the kernel source, so it's really exceptional.

 What I meant is that the second comment should not depend on
BR2_LINUX_KERNEL, so both comments appear if you don't have the kernel nor
largefile selected.


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
