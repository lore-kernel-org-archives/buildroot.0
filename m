From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Apr 2020 23:16:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgit2: Bump to version 1.0.0
In-Reply-To: <20200415223258.2d5d406c@windsurf.home>
References: <20200414091439.25465-1-nicolas.cavallari@green-communications.fr>
 <20200415223258.2d5d406c@windsurf.home>
Message-ID: <20200415211636.GJ5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-15 22:32 +0200, Thomas Petazzoni spake thusly:
> On Tue, 14 Apr 2020 11:14:39 +0200
> Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:
[--SNIP--]
> > +LIBGIT2_LICENSE = GPL-2.0 with linking exception, BSD 4-clause variant (wildmatch), MIT (sha1)
> But here is the part that made me not apply the patch: this BSD
> 4-clause variant thing. The license text is at
> https://github.com/libgit2/libgit2/blob/master/COPYING#L995 and it
> doesn't seem to be a license known at https://spdx.org/licenses/. I'm
> not sure how to properly encode it.
> 
> Yann, Arnout, any suggestion?

We should only encode known, exact matches. Otherwise, we should only
list it like we do unknown license, like:

    libgit2 license (wildmatch)

What does not help in fact, is that the code does not originate
libgit2, but from git, which itself got it from rsync before it turned
GPLv3, which got it from somewhere.

However, the code is credited to a certain Rich Salz, in 1986, 34 years
ago now. There is even a Wikipedia page [0] about something really
closely related, wildmat, which is also described as bsing a pattern
matching library writen in 1986 by said Rich Salz. There is a wildmat
on github [1], also posted by Rich Salz, where they dedicate it to the
public domain.

[0] https://en.wikipedia.org/wiki/Wildmat
[1] https://github.com/richsalz/wildmat

Still, that does not say much about the actual copy in libgit2...

So, I'd just say something like

    wildmatch license (wildmatch)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
