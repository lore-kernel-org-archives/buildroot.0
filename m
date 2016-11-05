From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Nov 2016 13:31:15 +0100
Subject: [Buildroot] [PATCH 0/2] core: revert to using fakeroot instead
	of pseudo
In-Reply-To: <cover.1478342758.git.yann.morin.1998@free.fr>
References: <cover.1478342758.git.yann.morin.1998@free.fr>
Message-ID: <20161105123115.GD31560@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-11-05 11:46 +0100, Yann E. MORIN spake thusly:
> We very recently switched to using pseudo instead of fakeroot, because
> fakeroot has issues (which are hard to fix) with SELinux-enabled hosts.
[--SNIP--]
> Since we're now getting far ahead in the stabilisation phase, it makes
> sense to throw in the towel and revert bacvk to fakeroot, which for now
> has less issues than pseudo.
[--SNIP--]

After discussing the matter on IRC, we've decided to go another route,
to instead fix makedevs to make it check the file and accept if its
already the expected type, and only bail out if not.

Patches marked as rejected in patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
