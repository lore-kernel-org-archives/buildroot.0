From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jun 2021 18:17:21 +0200
Subject: [Buildroot] patch version support
In-Reply-To: <CAOiXNkCC+kkmPBR4OMdTVpXXuSUZjT+P9_TRmitca2f0m9vBZg@mail.gmail.com>
References: <CAOiXNkCC+kkmPBR4OMdTVpXXuSUZjT+P9_TRmitca2f0m9vBZg@mail.gmail.com>
Message-ID: <20210608161721.GM168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrey, All,

On 2021-06-08 11:19 +0200, Andrey Nechypurenko spake thusly:
> There is Yocto-based BSP with a bunch of patches and required
> configuration options. So I am trying to dig them out of Yocto and
> pack them into Buildroot. One of the problems I've got is in the
> Buildroot's support/scripts/apply-patches.sh script which actively
> rejects patches in newer format ("Error: patch contains some renames,
> not supported by old patch versions").
> 
> I found some old discussions about this decision and understand the
> motivation (enterprises stuck with old distributions, etc.). However,
> there has been quite some time since this discussion. If I am not
> mistaken, this "newer" patch format is about 10 years old for now. So
> my question is if it would make sense to remove this restriction?

This has already been done as of commit f46e13f05fa0 (support/dependencies,
scripts: accept patches with renames).

This commit is however not part of any released version; it is for the
moment only on the master branch of the repository.

So, if you are about to submit support for some new board based on
existing patches, you will benefit from this change when you rebase on
master. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
