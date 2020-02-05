From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 17:19:48 +0100
Subject: [Buildroot] [PATCHv2] package/ncurses: add upstream (security)
 patches up to 20200118
In-Reply-To: <20200205133111.24540-1-patrickdepinguin@gmail.com>
References: <20200205133111.24540-1-patrickdepinguin@gmail.com>
Message-ID: <20200205161948.GG3131@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2020-02-05 14:31 +0100, Thomas De Schampheleire spake thusly:
> From: Peter Korsgaard <peter@korsgaard.com>
> Fixes the following security issues:
[--SNIP--]
> While we are at it, adjust the white space in the .hash file to match
> sha256sum output for consistency.
[--SNIP--]
>  # Locally computed
> -sha256	86106f0da1cf5ccfa0f0651665dd1b4515e8edad1c7972780155770548b317d9	COPYING
> +sha256  86106f0da1cf5ccfa0f0651665dd1b4515e8edad1c7972780155770548b317d9  COPYING

The hash for the license file is now wrong:

    >>> ncurses 6.1 Collecting legal info
    ERROR: COPYING has wrong sha256 hash:
    ERROR: expected:
    86106f0da1cf5ccfa0f0651665dd1b4515e8edad1c7972780155770548b317d9
    ERROR: got     :
    4d1fde61868c73776a539366dccf5d5a4857e7fd7299efb1f02e07c2afe9ea87
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [package/ncurses/ncurses.mk:200: ncurses-legal-info] Error 1
    make: *** [Makefile:23: _all] Error 2

That's because it has been changed by ncurses-6.1-20200104, to change
the Copyright year.

Fixed that and pushed, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
