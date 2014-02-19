From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Feb 2014 18:45:36 +0100
Subject: [Buildroot] [PATCH v2 0/6] Add toolchain knob for NPTL
In-Reply-To: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5304EDC0.4010001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/14 22:08, Thomas Petazzoni wrote:
> Hello,
> 
> This is v2 of the NPTL patch series. Changes since v1:
> 
>  * Made the comment string "NPTL" instead of "NPTL threads", as
>    suggested by Thomas De Schampheleire.
> 
>  * Rebased on top of the next branch.
> 
> Original cover letter:
> 
> We have a growing number of packages that need pthread functions only
> available when the NPTL implementation is used. But at the same time,
> we have several architectures (AVR32, ARC, Blackfin and Xtensa) that
> don't support NPTL.
> 
> This set of commits adds a new hidden toolchain config knob named
> BR2_TOOLCHAIN_HAS_THREADS_NPTL, and uses it in four packages: three
> were already having special conditions to more-or-less detect the
> availability of NPTL, and one package (qt5) which fixes an autobuilder
> failure.

 You're missing a patch to docs/manual/adding-packages-directory.txt to
standardize the comment.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
