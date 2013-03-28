From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Mar 2013 09:07:15 +0100
Subject: [Buildroot] [git commit] Makefile: simplify target skeleton
	copying
In-Reply-To: <5153EE16.8070207@mind.be> (Arnout Vandecappelle's message of
 "Thu, 28 Mar 2013 08:15:34 +0100")
References: <20130326074214.D6DFF9B2CA@busybox.osuosl.org>
 <5153EE16.8070207@mind.be>
Message-ID: <87ip4c3q30.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 26/03/13 08:33, Peter Korsgaard wrote:
 >> +	rsync -au --exclude=.empty --exclude=CVS --exclude=.svn --exclude='*~' \
 >> +		$(TARGET_SKELETON)/ $(TARGET_DIR)/

 Arnout>  Since TARGET_SKELETON can be configured to point to a git- or
 Arnout> mercurial-controlled directory, I'd want to exclude those as well. How
 Arnout> about the --cvs-exclude --include core that ThomasDS introduced?

We can do that as well. I was a bit afraid of excluding files people
wanted to keep, so I kept it how it was - But yes, like likelyhood is
quite small.

Care to send a patch to do this?

-- 
Bye, Peter Korsgaard
