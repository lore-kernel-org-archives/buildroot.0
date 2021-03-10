From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Mar 2021 22:29:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix tarball hash
In-Reply-To: <20210310212437.GR2737665@scaer>
References: <20210310191802.264463-1-fontaine.fabrice@gmail.com>
 <20210310212437.GR2737665@scaer>
Message-ID: <20210310212921.GS2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-10 22:24 +0100, Yann E. MORIN spake thusly:
> On 2021-03-10 20:18 +0100, Fabrice Fontaine spake thusly:
> > tarball hash is broken since commit
> > 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/712167620d46ed0175da89dfe77a8db2534b925d
> The issue happens on my autobuilder, so I will be able to investigate.

In fact, I would have had to just look at the build log, which already
explains what is going on:

    svn: invalid option: --show-item
    Type 'svn help' for usage.

So it means the svn backend expects a more recent svn.

Sigh. Let's see how we can fix that...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
