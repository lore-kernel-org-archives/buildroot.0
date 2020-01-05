From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jan 2020 20:45:54 +0100
Subject: [Buildroot] [PATCH v2 0/8] pkg-stats json output improvements
In-Reply-To: <20200105092329.6288-1-heiko.thiery@gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
Message-ID: <20200105204554.421b0ef7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Sun,  5 Jan 2020 10:23:22 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> This patches add several improvements for the json output of the
> pkg-stats script.
> 
> - add developers information to the packages
> - add supported defconfigs to json
> - add license information to json
> - add more generic status field to the packages

Thanks for this new iteration. There is however one really important
thing that I missed in the review of v1: the JSON provided by pkg-stats
is then used by other tools. So if you change the layout/format of the
JSON file, those tools also need to be modified accordingly.

The tool consuming the JSON file today is the daily-mail script at
https://git.buildroot.org/buildroot-test/tree/utils/daily-mail. I think
the only function that needs to be modified is
https://git.buildroot.org/buildroot-test/tree/utils/daily-mail#n549.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
