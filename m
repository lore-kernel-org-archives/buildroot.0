From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 11:18:22 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package
 to libltdl only
In-Reply-To: <b4e54580-453f-e184-4c82-531ed56cca8b@mind.be>
References: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
 <20181124184708.GB20308@scaer>
 <7ef83036-fe64-9ca2-e2d0-689f428f5fff@mind.be>
 <1543225130.5778.5.camel@Nokia-N900>
 <b4e54580-453f-e184-4c82-531ed56cca8b@mind.be>
Message-ID: <20181126111822.053c42a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Nov 2018 11:12:42 +0100, Arnout Vandecappelle wrote:

>  On second thought, maybe we should just remove the automatic inheritance for
> _SUBDIR entirely.
> 
>  There are 15 host packages that set _SUBDIR.
> 
>  Of these, 6 are host-only (e.g. gcc) so the automatic inheritance is pointless.
> 
>  Of the remaining 9:
> - 2 override only HOST_XXX_SUBDIR (asterisk, cxxtest).
> - 1 has a different SUBDIR for host and target (gettext).
> - 1 overrides HOST_XXX_SUBDIR back to its default (gdb).
> - 1 defines both with the same value (icu).
> - 4 actually use the inheritance (capnproto, libnspr, tcl, vim).
> 
>  So it hardly seems worth to have the automatic inheritance, if only 1/3 of its
> occurences are actually useful.

Dropping the automatic inheritance of _SUBDIR is fine with me.

However, while we are talking about _SUBDIR, what about making progress
on the discussion we had related to
https://patchwork.ozlabs.org/project/buildroot/list/?series=70199 ? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
