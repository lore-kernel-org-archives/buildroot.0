From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Sep 2016 09:17:13 +0200
Subject: [Buildroot] [PATCH v2 2/2] buildroot-test: failure reason regex
 update
In-Reply-To: <20160906220459.4ed92fe7@free-electrons.com>
References: <1459468972-31420-1-git-send-email-matt@thewebers.ws>
 <1459468972-31420-2-git-send-email-matt@thewebers.ws>
 <20160906220459.4ed92fe7@free-electrons.com>
Message-ID: <20160907091713.12df6aa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Sep 2016 22:04:59 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 31 Mar 2016 19:02:52 -0500, Matt Weber wrote:
> > - Sub-make required one additional line tailed
> > - Both autobuild-run  regex to truncate end log
> >   and import which sets the failure reason on
> >   the report are updated
> > 
> > Signed-off-by: Matt Weber <matt@thewebers.ws>
> > 
> > --
> > Changes for v2:
> > - Added back in : as previous test masked
> >   that is was ok to leave in (Suggested by Thomas)
> > ---
> >  scripts/autobuild-run | 4 ++--
> >  web/import.inc.php    | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)  
> 
> Applied to buildroot-test, and deployed on autobuild.b.o. Of course,
> it's up to the people using autobuild-run to update it on their side.

And I just reverted this commit, as it broke the autobuilders. For a
large number of builds, the failure reason was no longer identified
properly, and the script was concluding that the failure reason was
"all" or "all-recursive" or "lib", i.e the name of a make target, and
not the name of the package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
