From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Oct 2016 14:39:38 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com> (Vicente
 Olivert Riera's message of "Mon, 24 Oct 2016 13:19:30 +0100")
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <874m42lztg.fsf@dell.be.48ers.dk>
 <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
Message-ID: <87ziltly45.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 >> If that is the only problem, couldn't we just add -mno-msa to the
 >> kernel/bootloader if _MIPS_MSA is enabled?

 > That would be a solution, filter (or append -mno-* counterparts) to the
 > flags when building kernel or bootloaders. The thing is we would need to
 > do this for other optimization options (not just MSA) and architectures.

 > Do we want to do that? It looks better and cleaner to have a variable
 > that holds flags suitable for building packages but not for building
 > kernels/bootloaders. I think that's what Arnout means with the
 > TARGET_EXTRA_CFLAGS.

Do we expect to have a lot of such new flags in the future? We already
do something similar for some of the arm specific flags (E.G. force
-marm for stuff that cannot be built in thumb2 mode).

I agree that it isn't very pretty, but again it is a tradeoff between
how complicated we want to make the toolchain wrapper.

-- 
Venlig hilsen,
Peter Korsgaard 
