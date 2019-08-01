From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 14:42:24 +0200
Subject: [Buildroot] [PATCH buildroot-test 0/4] add support for outdated
 packages
In-Reply-To: <20190708081406.28215-1-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
Message-ID: <20190801144224.69fde7c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As usual, this is good work, glad to see that we're finally getting
e-mail notifications for this. See below for some comments.

On Mon,  8 Jul 2019 10:14:02 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Victor Huesca (4):
>   utils/daily-mail: add information about version that may need an
>     update
>   utils/daily-mail: allow to print a header for results section
>   utils/daily-mail: add some debug information for the Notification
>     class
>   utils/daily-mail: add multiple argument to ease modularity of the
>     script

The main comment I have about the series is that it's not organized in
the proper order. For example, in PATCH 1/4, you add a new argument to
global_email(), which is not used anywhere.

I think you should instead introduce argparse, with just the --dry-run
option first. Then introduce the --branches option in one commit, then
introduce the --date option in another commit, then introduce the
--global-only and --dev-only options in another commit. Then the
introduction of the outdated changes stuff. I.e, really split
independent changes in separate commits.

Speaking of global-only and dev-only, perhaps we should do something
nicer, such as:

	--dest=dev,global --data=autobuild,outdated,defconfig,tests

It allows to select any combination of information and recipient, and
seems a bit more flexible.

But this can be done later. However, I'd really like to have separate
commits for the separate things.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
