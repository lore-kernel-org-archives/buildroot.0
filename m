From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:33:35 +0200
Subject: [Buildroot] [git commit] package/ca-certificates: fix rebuilds
In-Reply-To: <20181021133507.C5AB58828C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 21 Oct 2018 14:34:46 +0100")
References: <20181021133507.C5AB58828C@busybox.osuosl.org>
Message-ID: <87y3an8qxs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=42b10634c628918c753bfb1aad4f950fa5d41299
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Rebuilding ca-certificates using make ca-certificates-rebuild
 > caused duplicate certificates to be installed in the target. Its build
 > system is broken: it doesn't detect that the output file already exists,
 > and instead of overwriting it, a duplicate is generated under a
 > different name. The net effect is that all certificates are installed
 > twice after rebuild.

 > Fix this by cleaning the build directory before building the package.

 > Signed-off-by: Martin Bark <martin@barkynet.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
