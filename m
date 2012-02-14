From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Feb 2012 07:47:07 +0100
Subject: [Buildroot] [PATCH v3-resend 1/2] usb_modeswitch: update to
	1.2.3
In-Reply-To: <CAC78GpfYU7HLUP3QnvbLboh91e4YkLs2JBc7Thf+WC=6y+9ELw@mail.gmail.com>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <201202122321.34627.arnout@mind.be>
 <CAC78GpfYU7HLUP3QnvbLboh91e4YkLs2JBc7Thf+WC=6y+9ELw@mail.gmail.com>
Message-ID: <201202140747.07791.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 February 2012 03:57:05 J.C. Woltz wrote:
> > - .patch files should have a comment at the top explaining why it is needed,
> > and a Signed-off-by line.  Also, try to send the patch upstream, so we
> > don't need to carry it forward forever.
> 
> What do you mean by this? Buildroot already had a patch for
> usb_modeswitch. 
 Indeed, and this patch didn't have a Signed-off-by.  That's why this
remarks is for the next time you write a patch.
> - .patch files should have a comment at the top explaining why it is needed,
> and a Signed-off-by line.  Also, try to send the patch upstream, so we
> don't need to carry it forward forever.

What do you mean by this? Buildroot already had a patch for
usb_modeswitch. The only thing my patch did to the makefile was remove
the -s flag from two install commands. On a normal system, the -s on
the install makes sense. In a buildroot environment where the software
is not installed directly, this patch was needed. If you still believe
that an upstream patch is needed, then I can do that.
 BTW the new patch file doesn't reuse any change from the old patch file,
so if there would have been and S-o-b in the original patch file, you
wouldn't have had to keep it.

> The only thing my patch did to the makefile was remove
> the -s flag from two install commands. On a normal system, the -s on
> the install makes sense. In a buildroot environment where the software
> is not installed directly, this patch was needed. If you still believe
> that an upstream patch is needed, then I can do that.

 But since install -s makes cross-compilation more difficult, it shouldn't
be used by anyone :-).  The Makefile should at least replace it with
something configurable, e.g. $(STRIP) (which we can define to ":", because
we strip everything in the target directory but only if it was requested).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
