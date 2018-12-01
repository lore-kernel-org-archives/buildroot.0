From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Dec 2018 11:59:54 +0100
Subject: [Buildroot] [PATCH next v6 09/10] package/pkg-generic: make
 libtool .la files compatible with per-package directories
In-Reply-To: <20181130112012.23c89b84@windsurf>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-10-thomas.petazzoni@bootlin.com>
 <20181125175702.GD28830@scaer> <20181130112012.23c89b84@windsurf>
Message-ID: <20181201105954.GD18074@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-30 11:20 +0100, Thomas Petazzoni spake thusly:
> On Sun, 25 Nov 2018 18:57:02 +0100, Yann E. MORIN wrote:
> > Since I really want this topic to come to a conclusion sooner than
> > later, and since the solution is good-enough for now:
> > 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Thanks. However, since I have changed a bit this patch for v7, I will
> not include your Reviewed-by.
> 
> > I don't find it very clean that we shoe-horn such preparation in the
> > generic rules; I'd rather we use a hook mechanism, which we can define
> > for the prepare-per-package-directory macro to call.
> 
> I understand your proposal. However, I think that it's premature to
> introduce such a hook mechanism: for now there's only one such fixup to
> do. Let's wait until we have a few.
> 
> I have moved the code outside of the package step, into a helper
> function. It looks a bit nicer, and perhaps if we need to do other
> fixups this helper function can be extended to be the one doing all the
> per-package related fixups.
> 
> What do you think ?

If you were speaking of:
    https://git.bootlin.com/users/thomas-petazzoni/buildroot/commit/?h=ppsh-v7-work&id=5fd4ce2bbed14478d49afcd775f37eb8c4e487a4

... then you can keep my reviewed-by tag when you submit that new
iteration.

Thanks! :-)

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
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
