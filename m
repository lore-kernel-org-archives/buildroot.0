From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jun 2019 22:50:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix build with NLS
In-Reply-To: <CAFSsvmp7ODpQgTYaDSenwNUpMuta061HhOO4CcbUSO2NEAxkLQ@mail.gmail.com>
References: <20190611185542.21391-1-fontaine.fabrice@gmail.com>
 <CAFSsvmp7ODpQgTYaDSenwNUpMuta061HhOO4CcbUSO2NEAxkLQ@mail.gmail.com>
Message-ID: <20190611205055.GH13603@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, Adam, All,

On 2019-06-11 15:21 -0400, Adam Duskett spake thusly:
> We are discussing this currently on IRC and I think we have two
> options, perhaps you should join us?

I did absolutely not tell Adam to entice you to join. No I did not.

OK, I did. ;-)

> Basically, the two options are:
> 1) Use your above patch (which is what I originally suggested,
> although my code was a bit more hacky.)
> 2) What Yann is suggesting which is to expand pkg-meson.mk with
> something like: http://code.bulix.org/onc7x0-767490?raw
>     and then add the $(TARGET_NLS_LIBS) to the mk file.
> 
> I am liking option 2 a bit more, as it is another patch that we don't
> have to maintain.

So, it turned out to be the fix (last two commits):
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/meson-per-pkg-flags

I'm test-building the sucker for now, I'll spew the patches in a moment.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
