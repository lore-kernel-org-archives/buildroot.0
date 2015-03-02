From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Mar 2015 21:43:27 +0100
Subject: [Buildroot] Use case: legacy kernel with modern user-space?
In-Reply-To: <201502191302.17430.ste@junkomatic.net>
References: <201502191302.17430.ste@junkomatic.net>
Message-ID: <54F4CB6F.4030606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/02/15 14:02, Steve James wrote:
> Hello all,
> 
> We are using Buildroot with a vendor supplied 2.6 kernel and drivers, but I 
> wish to include some modern user-space tools. The problem is that these 
> require a newer GCC version that the one that was contemporary when the kernel 
> and drivers were written. The team is reluctant to move GCC forward (from 
> 4.5.3 to 4.7.4) for fear that this may expose subtle bugs in the vendor's 
> drivers.

 Which userspace tools don't build anymore with 4.5.3? If it's just one or two,
you could even consider compiling just that one with a first-stage 4.7.4 compiler.

> 
> Can I invite your thought on how to resolve this?
> 
> 1. I have attempted to persuade the team that the risk to upgrading the 
> compiler is acceptably small, that this is a difficult argument to win.
> 
> 2. I have proposed that we build only the kernel space with the old GCC and 
> build user-space with the new GCC. I realise this is going off piste for 
> Buildroot. What are the obstacles to this approach? Is it worth a try?

 I think this is your best bet. Toolchain for kernel and for userspace can be
completely different, and the kernel can easily be built outside of buildroot
(as long as you don't need to build out-of-tree modules like cryptodev of course).


 Regards,
 Arnout


> 
> If it matters, we are building stock GCC with crostool-NG but I'd be receptive 
> to alternative methods if it helped.
> 
> Thanks for your attention,
> Steve.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
