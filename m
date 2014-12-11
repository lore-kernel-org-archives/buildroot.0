From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 19:44:00 +0100
Subject: [Buildroot] [PATCH 2/8] Rename BR2_PREFER_STATIC_LIB to
 BR2_STATIC_LIBS
In-Reply-To: <1417642895-29606-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141211184400.GB4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-03 22:41 +0100, Thomas Petazzoni spake thusly:
> Since a while, the semantic of BR2_PREFER_STATIC_LIB has been changed
> from "prefer static libraries when possible" to "use only static
> libraries". The former semantic didn't make much sense, since the user
> had absolutely no control/idea of which package would use static
> libraries, and which packages would not. Therefore, for quite some
> time, we have been starting to enforce that BR2_PREFER_STATIC_LIB
> should really build everything with static libraries.
> 
> As a consequence, this patch renames BR2_PREFER_STATIC_LIB to
> BR2_STATIC_LIBS, and adjust the Config.in option accordingly.
> 
> This also helps preparing the addition of other options to select
> shared, shared+static or just static.
> 
> Note that we have verified that this commit can be reproduced by
> simply doing a global rename of BR2_PREFER_STATIC_LIB to
> BR2_STATIC_LIBS plus adding BR2_PREFER_STATIC_LIB to Config.in.legacy.

This patch no longer applies to crda and mpd because they were slightly
changed:
  - crda: switched from "depends on !nios2" to "depends on !nios2_toolchains"
  - mpd : help text for avahi slightly reworded.

Missing packages because newer than this patch:
  - ecryptfs-utils  (Config.in x2)
  - libnss          (Config.in x2)
  - lighttpd        (Config.in x2)
  - python-pam      (Config.in x2)
  - slang           (slang.mk  x1)

Otherwise I gues you atomated this bulk rename, so I only checked a few
packages, choosen randomly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
