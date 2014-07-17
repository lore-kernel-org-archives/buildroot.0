From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Jul 2014 00:46:15 +0200
Subject: [Buildroot] [PATCH] package/libconfuse: switch to the new
	upstream
In-Reply-To: <1405549965-22539-1-git-send-email-yann.morin.1998@free.fr>
References: <1405549965-22539-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140717224615.GG3737@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-17 00:32 +0200, Yann E. MORIN spake thusly:
> libconfuse is being migrated to github (see http://www.nongnu.org/confuse/)
> So, just follow suite.
> 
> Needs a bit of a hack so gettextize + autoreconf does not step on each
> other's toes. See comment in the patch.
[--SNIP--]

OK, so this bump is causing a bunch of autobuild failures:
    http://autobuild.buildroot.org/?reason=libconfuse-V2_7

Some of them are due to a problem while either gettextizing or
autoreconfiguring the package.

Thomas was able to reproduce this build failure:
    http://autobuild.buildroot.org/results/f60/f6089c90d4f0ba579725ac834d8ac43b839bbc3b/

However, I was not able to reproduce it; it builds fine for me, in a
Debian Squeeze 32-bit chroot.

I'm lost.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
