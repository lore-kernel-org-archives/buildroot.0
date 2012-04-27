From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Apr 2012 00:18:27 +0200
Subject: [Buildroot] How do you add to library path?
In-Reply-To: <jnc1d9$t1p$1@dough.gmane.org>
References: <jnc1d9$t1p$1@dough.gmane.org>
Message-ID: <201204280018.27254.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 26 April 2012 19:42:01 Grant Edwards wrote:
> What's the right way to permanently add a directory to the search path
> for dynamic libraries?  (Preferably at build-time, rather than at
> run-time.)

 You could use the -rpath linker option, but that risks conflicts with
libraries installed on the host (the linker puts rpath in front of the
library search path, disregarding the sysroot, so if a library with the
same name exists in that path on the host, the linker will link with that
one instead of the cross-compiled one).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
