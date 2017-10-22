From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Oct 2017 17:25:50 +0200
Subject: [Buildroot] [PATCH RFC] package/glibc: switch to using the
 maintenance branch
In-Reply-To: <59e6c3e0-9492-c433-91e0-db4dda9c76e1@gmail.com>
References: <20171021102206.29477-1-yann.morin.1998@free.fr>
 <38b149b1-8f27-d747-3b16-be54b43cdbd4@gmail.com>
 <20171021122223.GB7022@scaer>
 <5b08873b-fd57-5852-7920-3afc25368c0d@gmail.com>
 <59e6c3e0-9492-c433-91e0-db4dda9c76e1@gmail.com>
Message-ID: <20171022152550.GA2599@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-10-22 17:16 +0200, Romain Naour spake thusly:
> Le 21/10/2017 ? 15:12, Romain Naour a ?crit?:
> > Le 21/10/2017 ? 14:22, Yann E. MORIN a ?crit?:
> >> On 2017-10-21 13:31 +0200, Romain Naour spake thusly:
> >>> Le 21/10/2017 ? 12:22, Yann E. MORIN a ?crit?:
> >>>> The version number is obtained with:
> >>>>     $ git describe --match 'glibc-*' --abbrev=40 origin/release/2.26/master
[--SNIP--]
> >>> I can't clone this repo from here using https:
> >>>
> >>> error: Unable to get pack index
> >>> https://sourceware.org/git/glibc.git/objects/pack/pack-f7640727c0f4d6c3389f46d7d6540bbd74f2c136.idx
> >>> error: Failed to connect to sourceware.org port 443: Connection timed out
> >>> (curl_result = 7, http_code = 0, sha1 = eb4488dc33fedcd7cdb5907a82f18f1d300d533b)
> >>> error: Unable to find a1fd1e8a3e17d0f846df142d93aa2af0bc16ced0 under
> >>> https://sourceware.org/git/glibc.git
[--SNIP--]
> It seems that using https://sourceware.org/git/glibc.git is not a reliable.
> The https connection timeout most of the time.
> A lot of build has been broken in my gitlab when I was testing the
> toolchain-builder infra.
> 
> Since git:// can't be used behind a proxy, we have no choice but use
> http://sourceware.org/git/glibc.git

Using http:// is very unreliable for me, while https:// had only some
occasional failures, indeed...

I don't want we swtich to git:// because of proxies, as you explained,
but at the same time we can't rely on cloning from any of http:// or
https://.

I don't know where to  go from there.

Of course, some autobuilders will end up doing the tarball in the end,
and this would eventually land on sources.buildroot.org, and all will be
happy, but this is not acceptable to _rely_ on s.b.o. in the first place,
especially for a pacakge that is still alive (for dead ones, that is
acceptable).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
