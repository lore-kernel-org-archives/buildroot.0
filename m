From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 22:51:07 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative
 path
In-Reply-To: <20140620200457.GA3543@free.fr>
References: <1403129424-27129-1-git-send-email-arnout@mind.be>
 <20140620200457.GA3543@free.fr>
Message-ID: <20140623205107.GC3572@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-06-20 22:04 +0200, Yann E. MORIN spake thusly:
> On 2014-06-19 00:10 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> > The graph-depends commands cd into the CONFIG_DIR and run the script
> > from there. However, this means that when $(O) is a relative path, it
> > will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).
> > 
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

OK, these are still valid, but for other reasons!

Tested with the test-case by Arnout:
    make O=my-output defconfig
    make O=my-output graph-depends

plus another deviation from this test-case:
    make -C buildroot O=my-output defconfig
    make -C buildroot O=my-output graph-depends

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
