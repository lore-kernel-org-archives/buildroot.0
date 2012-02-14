From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Feb 2012 23:22:17 +0100
Subject: [Buildroot] [PATCH] libatomic_ops: Remove duplicate targets
In-Reply-To: <4F38DB27.5090707@imgtec.com>
References: <4F38DB27.5090707@imgtec.com>
Message-ID: <201202142322.18176.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 February 2012 10:43:03 Markos Chandras wrote:
> Hi,
> 
> Please review the attached patch. libatomic_ops refuses to install
> because the build system overwrites newly installed targets.

 I don't see how the duplicates could be a problem...  install (or 
install-sh) will just overwrite it the second time.  It has to,
otherwise running 'make install' a second time would fail.  Basically,
it works for me.

> The patch
> removes these targets from the Makefiles and runs autoreconf to
> regenerate the build system. If you need me to send the patch as a
> separate file please let me know. I haven't send this to upstream yet
> but I plan to do so.

 Of course, this is still relevant to send upstream.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120214/82bfc27e/attachment.html>
