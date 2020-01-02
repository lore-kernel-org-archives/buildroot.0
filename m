From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu, 2 Jan 2020 06:24:50 -0800
Subject: [Buildroot] [PATCH 1/1] package/dcron: create directories if
 needed on startup
In-Reply-To: <20200102143953.3c613b03@windsurf>
References: <20200102123746.2404602-1-chrismcc@gmail.com>
 <20200102143953.3c613b03@windsurf>
Message-ID: <CALURroSVJkhOnH+4GV8zEWjP6kXhWas24cLaR89-1Ln18vv-8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 2, 2020 at 5:39 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Christopher,
>
> On Thu,  2 Jan 2020 12:37:46 +0000
> Christopher McCrory <chrismcc@gmail.com> wrote:
>
> > Create the /var/spool/cron/crontabs and /var/spool/cron/cronstamps
> directories
> > on startup if they don't exist.  By default /var/spool is a symlink to
> /tmp so
> > the contents get deleted on reboot.  If the cronstamps directory does
> not exist
> > anything in /etc/cron.hourly/ , etc. will fail to run.
> >
> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>
> We already have http://patchwork.ozlabs.org/patch/1196301/ pending to
> fix the same issue. Could you instead have a look at Carlos patch and
> see if it fixes the problem for you as well ?
>
>
It looks like it would work. Its a superset of what I did.  The same basic
changes are made to the two init bits for creating the directories. The
source code patch addresses the bigger picture. The directory creating bits
from the earlier patch or my patch should fix the immediate bug. Changing
the way dcrond starts up can be thought of as a different issue.



Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200102/ae0423f2/attachment.html>
