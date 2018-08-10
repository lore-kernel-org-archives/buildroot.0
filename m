From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:50:51 +0200
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
Message-ID: <20180810225051.4f34fb06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, Stefan,

On Wed, 11 Jul 2018 09:31:10 -0500, Matt Weber wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> The PIE build flags are only intended for building executables and can not be
> used in relocateable links (-r), static builds and shared library build -
> including the flags here causes build errors.
> 
> So instead of parsing the PIE flags directly on the command line to gcc,
> include them in a gcc spec file where it is possible to only apply the flags
> when other incompatible flags are not set.
> 
> This method and the spec files are from the Fedora build system.
> 
> Originally submitted as
> http://patchwork.ozlabs.org/patch/907093/
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

I've read the whole discussion on this patch, but still I don't
understand which direction we want to take moving forward: move away
from handling options in the wrapper, and use a spec file for
everything ? Or keep the entire logic in the wrapper ?

I'm not happy at all with the approach of having some flags handled in
the wrapper, some flags handled through spec files. I believe choosing
the spec file direction makes this patch series more difficult to
merge, because we have to go through this whole discussion of spec file
vs. wrapper.

I have nothing against using spec files, but right now, our logic is
based on a wrapper program. Therefore, I would be more comfortable with
an approach that relies on the wrapper program, so that it is in line
with what we are doing today. Then, separately, we can discuss how our
wrapper can be replaced, completely or partially, by a spec file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
