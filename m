From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Dec 2012 19:16:31 +0100
Subject: [Buildroot] [PATCH RESEND] pkg-infra: pass --disable-doc if
	documentation is not enabled
In-Reply-To: <1355321242-1301-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 12 Dec 2012 15:07:22 +0100")
References: <1355321242-1301-1-git-send-email-arnout@mind.be>
Message-ID: <87zk1jm8zj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Many configure scripts support an option like --disable-doc,
 Arnout> --disable-docs or --disable-documentation.  Pass all of these
 Arnout> to configure.

 Arnout> In addition, not all Xorg packages accept the
 Arnout> --disable-xxx. Instead they look for xmlto and/or fop and build
 Arnout> documentation if they exist.  For host packages, this may lead
 Arnout> to build errors because /usr/bin/xmlto uses libxml2 and we set
 Arnout> LD_LIBRARY_PATH to point to $(HOST_DIR)/lib, which may contain
 Arnout> a libxml2 as well.  So it's essential to disable xmlto for host
 Arnout> packages.

Committed, thanks.

With this we can also drop a bunch of explicit --disable-doc* in
packages.

-- 
Bye, Peter Korsgaard
