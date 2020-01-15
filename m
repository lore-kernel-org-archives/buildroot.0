From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Jan 2020 21:43:02 +0100
Subject: [Buildroot] Allowing to build from Git branches
In-Reply-To: <20200115144048.424279f5@windsurf>
References: <20200114220401.61700031@windsurf>
 <CAFOYHZAq0Yrhg10m+U5UNa5+YRY+gcqDQ9K8sE+Sjg1P32edWQ@mail.gmail.com>
 <20200115090044.5b9d56d0@windsurf>
 <a299da2b-3b31-d9d3-ebbd-7c67b731ffe7@logilin.fr>
 <20200115144048.424279f5@windsurf>
Message-ID: <20200115204302.GG22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-01-15 14:40 +0100, Thomas Petazzoni spake thusly:
> On Wed, 15 Jan 2020 09:54:16 +0100
> Christophe Blaess <mailist@logilin.fr> wrote:
> > Would it be possible to have an option on a per-package basis to always 
> > by-pass the DL_DIR mechanism and re-fetch the sources?
> 
> Yes, that would definitely be an idea. There was some discussion
> yesterday evening about this on IRC with Yann E. Morin, and indeed one
> of the idea that came up is to have something like
> <pkg>_DOWNLOAD_TRANSIENT = YES, which would tell the download
> infrastructure to refetch from upstream everytime the package is built
> instead of using a locally available tarball.

I've jsut sent a proof-of-concept of this 'transient' mchanism, which
turned out to be relatively easy to come up with; there is even far more
boilerplate and documentation that actual code to implement the feature.

    http://lists.busybox.net/pipermail/buildroot/2020-January/271660.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
