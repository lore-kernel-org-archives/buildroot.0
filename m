From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jun 2021 21:48:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/lzlib: remove it
In-Reply-To: <CAB0FRss2s6ZcTpfojjcwYCKHUqi457u5o26BGOViKM4_bUuXXg@mail.gmail.com>
References: <20210613154240.2877974-1-francois.perrad@gadz.org>
 <20210613154240.2877974-2-francois.perrad@gadz.org>
 <20210614202744.GI2610983@scaer>
 <CAB0FRss2s6ZcTpfojjcwYCKHUqi457u5o26BGOViKM4_bUuXXg@mail.gmail.com>
Message-ID: <20210615194827.GM2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-06-15 13:30 +0200, Fran?ois Perrad spake thusly:
> Le?lun. 14 juin 2021 ??22:27, Yann E. MORIN < [1]yann.morin.1998@free.fr> a ?crit?:
>   On 2021-06-13 17:42 +0200, Francois Perrad spake thusly:
>   > Signed-off-by: Francois Perrad < [2]francois.perrad@gadz.org>
>   Removing a package should dully explained in the commit log.
>   lua-zlib that you taunt as a replcement, adertises that it is not 100%
>   percent compatible:
[--SNIP--]
>   ? ? To use this shim add the -DLZLIB_COMPAT compiler flag.
> 
> This is done by the rockspec:
> see [4]https://github.com/brimworks/lua-zlib/blob/master/rockspecs/lua-zlib-1.2-0.rockspec#L33

So, this is the kind of information that should be part of the commit
log, for example (e.g.: the rockspec file for lua-zlib automatically
enables this legacy shim, so packages autoamtically inherit it).

However, this is still not a drop-in replacement, because parts of the
API return different types than lzlib did.

So, if some packages really need that part, they can't use lua-zlib.

Additionally, it is still OK to keep an old package in the tree, at
least as long as there is no drop-in-replacement, or that there are
still in-tree users, and as long as it does not cause any build
failure, that is not much an issue...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
