From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Nov 2018 13:14:10 +0100
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <63ff6b02-b3c2-69d6-ec15-b34b1295fa68@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo,

On 06/09/18 00:22, Angelo Compagnucci wrote:
> Packages that need to resolve dependencies internally
> and use a package manager would harm the reproducibility
> of a build, moreover they escape the legal infrastructure
> not giving enough informations on licensing.
> 
> This patch adds a tainting mechanism in the form of a
> variable FOO_TAINTS that can be used to signal that
> a package harms the reproducibility or licensing under
> certain conditions.

 We had a discussion about this at the BR developer meeting, and we decided that
the taints mechanism is not worth it. As noted by Yann, it can only ever be used
for a warning, not to block anything, because there are ways to do the right
thing for e.g. BR2_REPRODUCIBLE.

 And if it is just a warning, then it can just be included in the help text of
the Config.in option. Or, if we want to make it stronger, a conditional comment.


> This opens the door to include per language dependency
> managers in buildroot.

 To be honest (not discussed, so purely my personal opinion), maybe we should
just relax our opposition against language package managers. Yes, there are
those 7 points (which I still haven't added to the documentation, shame on me)
but that doesn't mean it's entirely blocking.

 I hope I haven't opened a box of Pandora by saying this :-)

 Regards,
 Arnout
