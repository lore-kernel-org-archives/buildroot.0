From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 10:50:12 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: use '.br_real' instead of '.real'
	for the wrapped toolchain
In-Reply-To: <1444856755-2011-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 14 Oct 2015 23:05:54 +0200")
References: <20151011120859.7e786a73@free-electrons.com>
 <1444856755-2011-1-git-send-email-arnout@mind.be>
Message-ID: <876125281n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

I find the subject quite hard to understand. The .real / .br_real is
not for the WRAPPED toolchain, but for the RAW toolchain binaries.

 > If an externally built toolchain also wraps the toolchain executables,
 > there is a risk that it will also use the '.real' extension. To
 > minimise this risk, use a more buildroot-specific extension instead:
 > '.br_real'.

 > For the time being, this is not yet a problem since the internal
 > toolchain never has such a wrapper. However, in a later commit we
 > will bypass the buildroot wrapper for external toolchains, so we
 > have to avoid doing that when it's not buildroot that wrapped it.

I'm not sure what you mean here. We DO have a a wrapper for the internal
toolchain.

Committed with the description reworded, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
