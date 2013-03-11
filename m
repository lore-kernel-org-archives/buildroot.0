From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Mar 2013 01:26:37 +0100
Subject: [Buildroot] [PATCH 2/6] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <20130310145851.4f1f6539@skate>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
 <20130310145851.4f1f6539@skate>
Message-ID: <201303110126.38259.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 10 March 2013 Thomas Petazzoni wrote:
> On Thu,  7 Mar 2013 23:04:39 +0100, Yann E. MORIN wrote:
> 
> > +    # e2fsck will force a UUID, which we do not want
> > +    tune2fs -U clear "${IMG}"
> 
> I think you already explained that you're removing the UUID to make the
> filesystem creation reproducible (i.e avoid having random bits in the
> filesystem image). Even though I'm not it's entirely feasible (some
> binaries inside the filesystem may contain build dates and things like
> that), I think it's an interesting goal. So my only suggestion here
> would be to extend a bit your comment, to explain *why* you do not want
> this UUID.

Yes, will do.

> Maybe we could set the volume name to 'buildroot' ? I.e:
> 
> 	tune2fs -L buildroot "${IMG}"

Good idea, too.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
