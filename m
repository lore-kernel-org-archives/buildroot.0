From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Jun 2017 23:37:23 +0200
Subject: [Buildroot] [PATCH] package/gdb: add support for gdb 8.0
In-Reply-To: <20170612093640.0b2da648@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 12 Jun 2017 09:36:40 +0200")
References: <20170605204648.11780-1-romain.naour@gmail.com>
 <20170611181043.0de6329f@windsurf.home>
 <e2edd343-47ed-146f-be62-419a61b52242@mind.be>
 <20170612093640.0b2da648@windsurf.home>
Message-ID: <87d1a7bmcs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sun, 11 Jun 2017 23:17:36 +0200, Arnout Vandecappelle wrote:

 >> > Applied to master, thanks. Do you intend to send a patch that updates
 >> > the default gdb version to 7.12, and drop support for 7.10 ?  
 >> 
 >> Since we've been discussing version dropping, perhaps it's time to consider gdb
 >> as well.
 >> 
 >> Is there really any reason to support multiple versions of gdb?
 >> 
 >> If yes, is there a reason to not use the latest version as default?
 >> 
 >> And the same questions for binutils.

 > All this version selection stuff is very historical. I guess one reason
 > for it is to allow people to upgrade Buildroot while keeping the same
 > toolchain components, which are often quite sensitive to changes.
 > That's the main reasoning.

Indeed. People should normally not use the internal toolchain support
(E.G. rebuilding the toolchain every time) for real projects, but
yeah. You can still reuse a toolchain built with an older BR version,
but you naturally don't get any of the new fixes.

With that said, our internal toolchain component version options do make
it unrealistic for us to really test all combinations, so gradually
limiting the number of supported versions going forward is probably the
way to go.

-- 
Bye, Peter Korsgaard
