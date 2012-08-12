From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 17:26:41 +0200
Subject: [Buildroot] [PATCH 02/20] toolchain-crosstool-ng: use the
 Crosstool-ng config options instead of the common hidden ones
In-Reply-To: <201208121705.55967.yann.morin.1998@free.fr>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <d670b74d596c2d7c4cfbb611b0837950945c488e.1344706801.git.thomas.petazzoni@free-electrons.com>
 <201208121705.55967.yann.morin.1998@free.fr>
Message-ID: <20120812172641.2eb74012@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 17:05:55 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> It was my impression that we would get rid of backend-specific options,
> and use a central point where those options would be selected.
> 
> As such, patches 1 & 2 are getting away from this goal, unless there is
> something I missed (eg. a future work that will rule them all).

Well, it is not possible to get rid of backend-specific options,
because the prompts and help text of those options are not the same, as
they don't mean the same thing. For internal backend, the wchar option
is "I want the wchar support in the toolchain that you will generate",
while for the external backend, the wchar option is "Does the external
toolchain you're giving me has wchar support". That's the very reason
why we have per-backend visible options that select common hidden
options. Does that make sense?

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
