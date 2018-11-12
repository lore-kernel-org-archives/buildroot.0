From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 09:06:42 +0100
Subject: [Buildroot] [PATCH] libtool: Make libltdl a separate package
In-Reply-To: <56b213a9-830f-e08f-faba-401d7296e32c@mind.be>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111221717.0855ea32@windsurf.home>
 <56b213a9-830f-e08f-faba-401d7296e32c@mind.be>
Message-ID: <20181112080642.GB10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Alexander, Arnout, All,

On 2018-11-11 23:15 +0100, Arnout Vandecappelle spake thusly:
> On 11/11/2018 22:17, Thomas Petazzoni wrote:
> > On Sun, 11 Nov 2018 16:06:46 +0100, Alexander Sverdlin wrote:
> >> This will save megabytes on the target filesystem if target packages only
> >> require libltdl part of libtool.
> > In fact, I don't think we need the full libtool on the target at all,
> > so perhaps we should just change the existing libtool package in its
> > target variant to only install libltdl ?
[--SNIP--]
>  I agree. If anybody needs the rest of libtool, then we can add an option like
> BR2_PACKAGE_LIBTOOL_FULL or _TOOLS or something like that,

Agreed.

> similar to e.g.
> libcurl (where BTW curl was originally a separate package but we merged it).

Exceot that, because of that legacy, curl is a bad example, as the
option is badly named.

A better exaple would be libcap (_TOOLS) or gnutls (_UTILS).

I would favour the _TOOLS suffix, even though we have both in tree.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
