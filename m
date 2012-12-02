From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Dec 2012 08:05:34 -0800
Subject: [Buildroot] [PATCH] pkg-download.mk: Fix shallow clone
In-Reply-To: <1354445767-15308-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Sun, 2 Dec 2012 11:56:07 +0100")
References: <1354445767-15308-1-git-send-email-sho@relinux.de>
Message-ID: <8738zo7835.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Some git versions (e.g. 1.7.0) do not treat trying to shallow clone
 Stephan> a non existing branch or tag as a fatal error but report a warning
 Stephan> and clone HEAD instead. Thus the fallback mechanism does not work
 Stephan> in this case.

 Stephan> This patch introduces a check for the presence of the requested
 Stephan> version as a branch or tag before trying the shallow clone. It
 Stephan> also removes the need to do two clones when a sha1 is given as
 Stephan> a packege version.

Thanks, committed.

I really do think we need to move the git handling into an external
script, because this isn't really readable anymore - But that's for
post-2012.11.

I've changed the cut -b 42- into cut -f2- as that's more robust (and
readable imho).


-- 
Bye, Peter Korsgaard
