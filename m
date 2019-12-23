From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Dec 2019 18:16:58 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <20191222225727.7e8f88d4@windsurf>
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
 <20191222223650.1f44d3ca@windsurf>
 <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
 <20191222225727.7e8f88d4@windsurf>
Message-ID: <20191223171658.GN26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Heiko, All,

On 2019-12-22 22:57 +0100, Thomas Petazzoni spake thusly:
> On Sun, 22 Dec 2019 22:40:43 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> 
> > > Thanks. Could you check whether the tarballs that are now produced by
> > > this are identical to the tarballs we already have on
> > > sources.buildroot.org ?  
> > 
> > I checked this for the fis package and unfortunately this is not the
> > case. Do you expect to have the same hashes?
> 
> Probably not, because with your change we now generate the tarballs
> differently.
> 
> Normally, it is annoying because it means the hash has changed,
> breaking the build for older Buildroot users, if we update the tarballs
> on sources.buildroot.org.
> 
> However, in this case, current Buildroot does not have any hash (as far
> as I can see) for Subversion-fetched packages. So we could introduce
> your change and update the tarballs on sources.buildroot.org at the
> same time, and then introduce hashes in those packages.
> 
> Peter, Yann, what do you think ?

I am 100% on-line with regenerating the tarballs so they are reproducible,
even if that means updating s.b.o.

> We have only very few Subversion-fetched packages, I think we should
> keep it simple.

In practice, we have only two: fis and open2300. The other packages that
may use svn are those where the user would set the version, so they
would anyway be excluded from the hash check.

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
