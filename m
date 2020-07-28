From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Jul 2020 09:52:27 +0200
Subject: [Buildroot] [PATCH v3 0/8] Improving CVE reporting
In-Reply-To: <20200724154356.2607639-1-gregory.clement@bootlin.com>
References: <20200724154356.2607639-1-gregory.clement@bootlin.com>
Message-ID: <20200728095227.7c9af284@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gr?gory,

On Fri, 24 Jul 2020 17:43:48 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Titouan also mentioned that CPE nodes can be ORed or ANDed and I
> confirm it. So I had a closer look on it. First found there are
> children node only with the AND operator. Then most of the time the
> AND associate a version of product than could be affected with a
> version of another product which usually provide service to the first
> one such as an operating system. Or we could have the association of a
> software and an hardware. Having an application in the second part of
> the AND can happen but is very rare.
> 
> Supporting these features will make the code more complex. By just
> parsing the node recursively without applying the AND condition, we
> could have some false positive CVE. But at least we won't miss CVE and
> the case were it would be useful for buildroot should be very scarce.

Could you give some specific example of where those AND operators with
child nodes are used ? This would help understand what are the
situations that make use of this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
