From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 22:58:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/{chrony, ntp,
 openntpd}: turn off DNSSEC validation
In-Reply-To: <20210708111627.3795182-1-james.hilliard1@gmail.com>
References: <20210708111627.3795182-1-james.hilliard1@gmail.com>
Message-ID: <20210716225832.327f2fee@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  8 Jul 2021 05:16:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We have a chicken and egg problem: validation of DNSSEC signatures
> doesn't work without a correct clock, but to set the correct clock we
> need to contact NTP servers which requires resolving a hostname, which
> would normally require DNSSEC validation.
> 
> Let's break the cycle by excluding NTP hostname resolution from
> validation for now.
> 
> Details:
> https://github.com/systemd/systemd/commit/abf4e5c1d3ad767bc0ed67883e8e4d916af095ec
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/chrony/chrony.service | 4 ++++
>  package/ntp/ntpd.service      | 4 ++++
>  package/openntpd/ntpd.service | 4 ++++
>  3 files changed, 12 insertions(+)

I'm not an expert in this area, but the explanation seems sensible, and
nobody complained so far, so I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
