From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 16:33:02 +0200
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
Message-ID: <20180604163302.2d529afd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jun 2018 14:32:29 +0100, Robert Beckett wrote:
> Since changing to git init followed by fetch to initialise
> git cache, when using master branch as the target version
> for a package, git refuses to fetch in to currently checkout
> out branch or master.

I think we don't want to support using branches as Git versions, as it
doesn't make sense, because it won't behave as the user expects.

If you use a branch as _VERSION for a package, Buildroot will only
download once, and never update to newer commits in this branch,
because it will already have a cached tarball in its DL_DIR.

So I'm not sure we want to add some code to support a use case that we
don't want support :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
