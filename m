From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 14:17:20 +0200
Subject: [Buildroot] [PATCH v2] skeleton: /etc/network/interface.d/*
	support
In-Reply-To: <8737jnnubv.fsf@dell.be.48ers.dk>
References: <1471361908-51757-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161022232831.030a10ad@free-electrons.com>
 <8737jnnubv.fsf@dell.be.48ers.dk>
Message-ID: <20161023141720.626b89d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 14:06:12 +0200, Peter Korsgaard wrote:

> We afaik provide no explicit guarantees on the ordering of the various
> _TARGET_FINALIZE hooks

Correct.

>, but it afaik will run in (package-)alphabetical
> order, E.G. before the finalize hooks of skeleton so this doesn't work
> :/

Hum, my thinking was that it did not matter if the "source" line is
before or after the lo definition. However, the skeleton package
completely overwrites the file, so indeed, it doesn't work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
