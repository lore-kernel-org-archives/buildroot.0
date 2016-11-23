From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Nov 2016 19:50:18 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <06119bed-14a8-0c38-9523-55f9759b4ab2@mind.be>
References: <20161122212534.GA3529@free.fr>
 <315eabd4-eb7f-2e83-c8f8-caa5a3cd3099@mind.be>
 <20161123063723.sy6vf3vfscrtg45e@gportay>
 <06119bed-14a8-0c38-9523-55f9759b4ab2@mind.be>
Message-ID: <20161123185018.GA13048@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-23 11:10 +0100, Arnout Vandecappelle spake thusly:
[--SNIP--]
>  Note that another issue is that packages may mess with TARGET_DIR outside of
> install-target. They shouldn't, of course, but you never know... So we should
> also add some protection that detects this.

Yup, redirect TARGET_DIR to a temporary place during the staging and
host installs, and detect if this is not empty (ditto for staging during
target install...).

But for some packages (toolchain?) we install both in staging and target
in the same command set... (I had started a aseries that did the split
some two years ago, I just trashed it for various reasons).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
