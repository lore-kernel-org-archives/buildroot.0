From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Nov 2015 13:04:35 +0100
Subject: [Buildroot] Kernel patches in Buildroot
In-Reply-To: <56432809.3000902@synopsys.com>
References: <56432809.3000902@synopsys.com>
Message-ID: <56432ED3.7070008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-11-15 12:35, Joao Pinto wrote:
> Hi,
> We are designing the procedure to release our software stack based on buildroot.
> Could you please tell what is the advised method for including a kernel patch
> set in buildroot? I typically use BR2_LINUX_KERNEL_PATCH where I indicate each
> patch file. Is there a easier way like using BR2_GLOBAL_PATCH_DIR for example?

 I personally prefer to use a git repository that includes the patches. During
development, I make a local checkout specified with LINUX_OVERRIDE_SRCDIR; for
release, I point to the repository (often on gitlab) and specify a tag.

 BR2_GLOBAL_PATCH_DIR and BR2_LINUX_KERNEL_PATCH are basically equivalent, you
can specify a directory with the latter as well.


 Regards,
 Arnout

> 
> Thanks for your help!
> 
> Joao
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
