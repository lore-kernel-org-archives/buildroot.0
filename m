From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Mar 2017 08:11:07 +0100
Subject: [Buildroot] Download tag as archive from gitlab
In-Reply-To: <CA+TH9Vmhs+bLmoo5UvD5VWAPahsDnseJ-eeEcBQJrwDHDKUQrQ@mail.gmail.com>
References: <CA+TH9Vmhs+bLmoo5UvD5VWAPahsDnseJ-eeEcBQJrwDHDKUQrQ@mail.gmail.com>
Message-ID: <20170307071107.GA3676@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2017-03-07 00:28 +0100, Angelo Compagnucci spake thusly:
> I'm hitting some bumps trying to download a tag from gitlab as an
> archive, the url format is like this:
> 
> https://gitlab.com/gitlab-org/gitlab-ce/repository/archive.tar.bz2?ref=v6.9.2
> 
> I can succesfully download the file, but then it's named
> "archive.tar.bz2?ref=v6.9.2" but it cannot be extracted cause it lacks
> an extensions and buildroot cannot choose the right helper to
> decompress it.
> 
> How such an url can be downloaded in buildroot?

The only solution is to download it with a git clone:

    FOO_VERSION = TAG_OR_SHA1
    FOO_SITE = https://gitlab.com/gitlab-org/gitlab-ce
    FOO_SITE_METHOD = git

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
