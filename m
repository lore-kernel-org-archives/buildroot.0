From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 11:01:28 +0200
Subject: [Buildroot] [PATCH 0/3] Fix udftools in static linking scenarios
In-Reply-To: <CA+NV+Vkr04dq4b78zXPMG1mV7Trz8KQP3=6si+7LJjJsrwmpfg@mail.gmail.com>
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
 <CA+NV+Vkr04dq4b78zXPMG1mV7Trz8KQP3=6si+7LJjJsrwmpfg@mail.gmail.com>
Message-ID: <20180504110128.500a5d1d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Apr 2018 11:03:14 +0530, Rahul Bedarkar wrote:

> Using pkg-config file is indeed a correct fix. But I think we should
> understand why readline doesn't install .pc file by default. This
> might be a reason that it is outdated and incorrect. Yes, in past we
> have fixed static linking with readline for many packages by passing
> it's private libraries.
> 
> May be if we first upstream readline changes with .pc installation in
> autotools files, it would be nice to use fix. Otherwise, we need to
> maintain patch and .pc file updated (in case of any changes in list of
> private libraries).

My readline patch fixing the .pc file contents was merged upstream:

  https://lists.gnu.org/archive/html/bug-readline/2018-05/msg00000.html

And I've submitted another patch that does install the .pc file:

  https://lists.gnu.org/archive/html/bug-readline/2018-05/msg00002.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
