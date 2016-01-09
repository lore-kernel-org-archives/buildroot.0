From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2016 18:38:11 +0100
Subject: [Buildroot] [RFC 1/1] package/asterisk: new package
In-Reply-To: <1430068623-2118-2-git-send-email-bernd.kuhls@t-online.de>
References: <1430068623-2118-1-git-send-email-bernd.kuhls@t-online.de>
 <1430068623-2118-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160109173811.GB3444@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-26 19:17 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                               |    1 +
>  package/asterisk/0001-configure-cross-fix.patch |   22 +
>  package/asterisk/0002-ASTERISK-24155.patch      |  241 ++
>  package/asterisk/0003-resinit.patch             |   15 +
>  package/asterisk/0004-uclibc-pthread.patch      |   25 +
>  package/asterisk/0005-configure-uclibc.patch    |   18 +
>  package/asterisk/0006-no-xml-docs.patch         |   20 +
>  package/asterisk/Config.in                      |   73 +
>  package/asterisk/asterisk-addon-mp3-r201.patch  | 4076 +++++++++++++++++++++++
>  package/asterisk/asterisk.hash                  |    2 +
>  package/asterisk/asterisk.makeopts-13           |   54 +
>  package/asterisk/asterisk.mk                    |  106 +

Following a recent discussion on IRC, I've had a look at this monster
patch to add Asterisk.

It turns out that Thomas already had a much, much simpler patch to add
Asterisk, but it was definitely not in shape to be sent. So I took the
job of looking at this asterisk stuff, and started from scratch. 

In ow have a series that I believe is much saner than any of two
existing patches, so I'll be shortly proposing this series on the list.
In the ,meantime, it's browseable:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/asterisk

Yes, it's 34 patches, but it starts with a much cleaner base, with
everything disabled, no hard-coded menuselect-stuff, no monster mp3
patch, adding extra features one by one, up to  pretty-complete solution
I believe (there are still missing pieces, but without reall HW or no
VoIP setup to test against, I can't do much for now...)

So, I'll be marking this patch as rejected on Patchwork for now; my
series should come to the list soonish...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
