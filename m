From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 15:53:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoup: needs host-python3
In-Reply-To: <20180830101430.14862-1-asafka7@gmail.com>
References: <20180830101430.14862-1-asafka7@gmail.com>
Message-ID: <20180901155329.726eb504@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 13:14:30 +0300, Asaf Kahlon wrote:

> Maybe this specific script can run even with python2, but I don't think patchting the
> "/usr/bin/env python3" line would be the right solution, especially considering
> the fact that they already have python3-only code in recent commits.

I disagree: the tld-parser.py script was changed from python to python3
with no reason other than "hey, let's use Python 3", and the script
works fine with Python 2. Plus in newer versions of libsoup, the script
has been removed entirely, and libsoup relies on a separate library to
provide TLD information.

So for now, I've committed a change that simply reverts the script to
use "python".

Thanks for your initial research on this topic!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
