From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 14:39:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/dcron: create directories if
 needed on startup
In-Reply-To: <20200102123746.2404602-1-chrismcc@gmail.com>
References: <20200102123746.2404602-1-chrismcc@gmail.com>
Message-ID: <20200102143953.3c613b03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Thu,  2 Jan 2020 12:37:46 +0000
Christopher McCrory <chrismcc@gmail.com> wrote:

> Create the /var/spool/cron/crontabs and /var/spool/cron/cronstamps directories
> on startup if they don't exist.  By default /var/spool is a symlink to /tmp so
> the contents get deleted on reboot.  If the cronstamps directory does not exist
> anything in /etc/cron.hourly/ , etc. will fail to run.
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

We already have http://patchwork.ozlabs.org/patch/1196301/ pending to
fix the same issue. Could you instead have a look at Carlos patch and
see if it fixes the problem for you as well ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
