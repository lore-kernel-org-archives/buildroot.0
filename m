From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:57:02 +0100
Subject: [Buildroot] [RFC] wine: Bump to 1.8
In-Reply-To: <564CF1C5.9080204@dawncrow.de>
References: <564CE703.2070706@dawncrow.de>
 <20151118222111.06e1de92@free-electrons.com>
 <564CF1C5.9080204@dawncrow.de>
Message-ID: <20151118225702.23400c0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Nov 2015 22:46:45 +0100, Andr? Hentschel wrote:

> >  * Use 'git format-patch -M' to enable rename detection, so that the
> >    renaming of the patches is detected, and instead of seeing a
> >    complete file being removed, and a complete file being added, we see
> >    a rename.
> 
> I also adjusted the patch a bit to apply to the new version

Not a problem: if the changes are not too important, it will still
detect the rename.

> > Last suggestion: can you submit the SANE_CONFIG patch upstream, so that
> > hopefully they merge it before the 1.8 release, and we can have zero
> > patches for the wine package ?
> 
> The patch won't go in as it is, because it would break
> non-cross-builds, also this problem is most likely not only true for
> sane, but also for other *-config programs, and I'm no configure
> guru...

Why do you say it breaks non-cross-builds? I looked again at
0003-sane-config-fix.patch and I don't really see how it can break
non-cross-builds.

The patch is just replacing 'sane-config' by
'${SANE_CONFIG:-sane-config}'.

${SANE_CONFIG:-sane-config} says "use the value of SANE_CONFIG is
available, otherwise use sane-config".

So, if SANE_CONFIG is not defined in the environment, this patch makes
zero difference compared to the existing situation. It only optionally
allows to pass SANE_CONFIG.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
