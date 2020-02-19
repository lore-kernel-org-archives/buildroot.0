From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 13:38:31 +0100
Subject: [Buildroot] CVE tracking for selected packages
In-Reply-To: <CAAXf6LURHBGiU6zTD-KQ85R+MjUxn9vJQc04-ViEXuS1r6HvCQ@mail.gmail.com>
References: <CAAXf6LURHBGiU6zTD-KQ85R+MjUxn9vJQc04-ViEXuS1r6HvCQ@mail.gmail.com>
Message-ID: <20200219133831.12b266fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Feb 2020 10:21:39 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> What would be another great improvement, is the possibility to check
> for a given defconfig in a particular Buildroot tree (i.e. not
> necessarily the master) which CVEs are not yet solved.
> 
> Basically something like:
> 
>     make cve-info

Absolutely.

> For the implementation, I assume we should either create a make target
> to call pkg-stats with the list of packages required, and perhaps
> restricting to CVE checking only (instead of also version checking),
> or extract the CVE logic to another file that can be reused by both
> pkg-stats as the new thing.

I don't think calling into pkg-stats is really a good idea for that, we
probably want some other "thing", possibly also used by pkg-stats.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
