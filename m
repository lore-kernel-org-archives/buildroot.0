From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:30:31 +0200
Subject: [Buildroot] [PATCH] norm: fix build failure with old headers
In-Reply-To: <56FD4EE5.9000701@zacarias.com.ar>
References: <1459431938-28257-1-git-send-email-gustavo@zacarias.com.ar>
 <20160331181848.00984a4f@free-electrons.com>
 <56FD4EE5.9000701@zacarias.com.ar>
Message-ID: <20160331183031.503a0e22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Mar 2016 13:23:01 -0300, Gustavo Zacarias wrote:

> Indeed it's probably not acceptable for old netfilter_queue 
> compatibility, though i made it the quick way since it was polluting the 
> autobuilders.

Sure. That's also why I applied.

> It's waf, my famous friend, i'll try to cook up a failproof test for it, 
> unfortunately netfilter_queue doesn't version the API in a visible way, 
> so maybe a pkg-config though i need to consult the author/maintainer 
> since it would be a new dependency to build.

I think version-based checks are broken. You should instead have a
check that actually tries to build a small piece of code that tests if
the API is old/new and see if the builds succeeds/fails.

But yeah, waf. Good luck.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
