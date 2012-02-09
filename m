From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Feb 2012 23:54:36 +0100
Subject: [Buildroot] [PATCH 1/8] linux: use the depmod built in HOST_DIR
In-Reply-To: <87mx92hiyr.fsf@macbook.be.48ers.dk>
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <20120201091257.636dc684@skate> <87mx92hiyr.fsf@macbook.be.48ers.dk>
Message-ID: <201202092354.36488.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 01 February 2012 12:49:16 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  >> Committed, thanks. Not released to this patch, but is the LZMA stuff
>  >> still used/needed?
> 
>  Thomas> It has been added by
>  Thomas> http://git.buildroot.net/buildroot/commit/target/linux/Makefile.in?id=ea8b1fa6a60705eedc5bd4f405f45c8f531c2126,
>  Thomas> which is a bit limited in details on why it was needed. I guess the
>  Thomas> goal was to tell the Linux build process to use the lzma utility built
>  Thomas> for the host by Buildroot, in case the Linux kernel is built (or the
>  Thomas> initramfs) with LZMA compression. But that remains to be verified.
> 
> Yes, I know - But I don't see anything using it right away grepping the
> kernel. I just wondered if anyone remembered what it was used for (and
> if it still is)?

 I also looked in detail at the kernel and I also don't think it can be used 
by anything.  Maybe it used to be used at some point, but I don't feel like
grepping through the entire kernel history to find that :-)

 So I also think it can be removed.  Anyway, the TARGET_PATH will make sure
that our host-lzma is used.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
