From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Feb 2016 23:26:55 +0100
Subject: [Buildroot] Confusion about location of custom Linux patches
In-Reply-To: <CAF_dkJA2VYCaAMTY=D3zsdV6YcAa1FS2w+8A2ygqrCuqQFWfCQ@mail.gmail.com>
References: <CAF_dkJA2VYCaAMTY=D3zsdV6YcAa1FS2w+8A2ygqrCuqQFWfCQ@mail.gmail.com>
Message-ID: <56CE2E2F.6060809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/16 20:56, Patrick Doyle wrote:
> According to the documentation in section 9.8:
> 
> "The exception to BR2_GLOBAL_PATCH_DIR being the preferred method for
> specifying custom patches is BR2_LINUX_KERNEL_PATCH."

 The next sentence reads:

+BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
are available at an URL.

 It could indeed be worded a bit more explicitly.

> 
> But later, in section 9.10, it says:
> 
> "Specifically for the Linux kernel, there also exists the option
> BR2_LINUX_KERNEL_PATCH with as main advantage that it can also
> download patches from a URL. If you do not need this,
> BR2_GLOBAL_PATCH_DIR is preferred."
> 
> I tried deciding that BR2_GLOBAL_PATCH_DIR was preferred, but now I'm
> not sure how to name the subdirectory inside BR2_GLOBAL_PATCH_DIR.  I
> have tried $BR2_GLOBAL_PATCH_DIR/kernel and
> $BR2_GLOBAL_PATCH_DIR/linux, and neither has seemed to work.

 linux is right. You must have done something else wrong. Do the file names end
with .patch?

 Also note that patches are skipped if you use BR2_LINUX_KERNEL_CUSTOM_LOCAL or
LINUX_OVERRIDE_SRCDIR.

 Regards,
 Arnout


> 
> So now I'm just gonna ask...
> 
> I am building outside the buildroot tree in a custom tree.  I have
> kernel patches that I need to apply (until such time as they get
> folded into the kernel).  Where is the best place to place them and
> how should that directory be named?
> 
> --wpd
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
