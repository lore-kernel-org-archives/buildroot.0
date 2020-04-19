From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 14:52:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/apcupsd: new package
In-Reply-To: <20200419003953.11676-1-james.hilliard1@gmail.com>
References: <20200419003953.11676-1-james.hilliard1@gmail.com>
Message-ID: <20200419145246.4717f1d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Apr 2020 18:39:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Apcupsd is a UPS control system that permits orderly shutdown of your
> computer in the event of a power failure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I've applied, after changing the order of the option in Config.in and
their handling in the .mk file so that they are sorted alphabetically.

However, one thing worries me: this package installs a binary called
'smtp' in $(TARGET_DIR)/usr/bin. 'smtp' seems like an awfully generic
name, which could easily clash with another package. Should we rename
that to apcupsd-smtp ? I'm not sure if 'smtp' gets used directly by
apcupsd, or it's only a tool that you can use in apcupsd's
configuration file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
