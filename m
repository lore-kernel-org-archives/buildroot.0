From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 09:08:03 +0100
Subject: [Buildroot] [PATCH] Makefile.legacy: fix recursive invocation
	with BUILDROOT_DL_DIR and _CONFIG
In-Reply-To: <1392068935-25510-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 10 Feb 2014 22:48:55 +0100")
References: <1392068935-25510-1-git-send-email-arnout@mind.be>
Message-ID: <87lhxivzq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The legacy support for the old BUILDROOT_DL_DIR and BUILDROOT_CONFIG
 > breaks down when make is invoked recursively - which is done in a few
 > cases, e.g. silentoldconfig, external-defs, ... These targets always
 > give a legacy error.

 > For BUILDROOT_DL_DIR, this is fixed by making sure that the original
 > value of BR2_DL_DIR taken from the environment is also exported again.

 > For BUILDROOT_CONFIG, this is fixed with an additional comparison of
 > the environment variable's value with the fake value that we introduce
 > ourselves.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
