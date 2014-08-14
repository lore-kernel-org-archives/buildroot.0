From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Aug 2014 18:41:20 +0200
Subject: [Buildroot] [PATCH v4] fio: add missing libaio dependency
In-Reply-To: <1408031710-18439-1-git-send-email-Matthew.Weber@rockwellcollins.com>
References: <1408031710-18439-1-git-send-email-Matthew.Weber@rockwellcollins.com>
Message-ID: <20140814184120.5ebc56d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 14 Aug 2014 10:55:10 -0500, Matt Weber wrote:
> The fio package dlopen()s the libaio library at runtime
> when the ioengine function is selected as libaio.
> 
> Signed-off-by Matt Weber <Matthew.Weber@rockwellcollins.com>

I had a quick look at the fio code base, and the configure script
(which is not autoconf based) seems to have some code to detect whether
libaio is present, and only use it when available.

Also, what seems to be dlopen()ed is not the libaio library itself, but
rather "external engines", i.e parts of fio.

So I'm not sure about your patch, and I'd like to do some more testing
about it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
