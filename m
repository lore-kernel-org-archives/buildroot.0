From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:36:03 +0200
Subject: [Buildroot] [PATCH] package/live555: update licenses
In-Reply-To: <20200813082235.890148-1-buildroot@heine.tech>
References: <20200813082235.890148-1-buildroot@heine.tech>
Message-ID: <20200813223603.4ab40f85@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Thanks for your contribution!

On Thu, 13 Aug 2020 10:22:35 +0200
Michael Nosthoff <buildroot@heine.tech> wrote:

> The included license files indicate that the project is licensed
> under GPL3.0 and LGPL3.0.
> 
> Even though the project site [1] only mentions LGPL.
> 
> - Add GPL-3.0+
> - Bump LGPL License to 3.0+
> - add the LGPL license file included in download
> 
> [1] http://live555.com/liveMedia/faq.html#copyright-and-license

In fact, there are no sources files under GPL-3.0: all the source files
indicate LGPL-3.0. So the presence of this COPYING file with the
GPL-3.0 license text seems to be a mistake.

So I've adjusted your commit to only mention the LGPL-3.0 license, 
added a comment in live555.mk about why we don't think anything is
under GPL-3.0 and applied to master.

Also, it's worth mentioning that the live555 developers themselves
don't seem to understand the LGPL very well. In the second bullet point
at http://live555.com/liveMedia/faq.html#copyright-and-license, they
claim:

  If you distribute a product (whether software or hardware; whether
  free or for pay) that uses the LIVE555 library code, then you must -
  when requested by either a customer, or Live Networks, Inc. - upgrade
  it as soon as possible to use the latest version of the LIVE555
  library code

This is clearly _NOT_ a requirement of the LGPL, and a license that
would have this requirement would not be a free software / open source
license.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
