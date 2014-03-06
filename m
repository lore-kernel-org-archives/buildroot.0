From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 17:54:35 +0100
Subject: [Buildroot] [PATCH 08/12] pkg-infra: don't use DL_DIR as
 scratchpad for temporary VCS checkouts
In-Reply-To: <CAHXCMMJ-rQzL+Jkn_9QNw5y6t4W+ADQATR1JWe_bWJjM3h+YDg@mail.gmail.com>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
 <46c87bc586c8fcf01ab538c6590c7a3cb4658344.1394055621.git.yann.morin.1998@free.fr>
 <CAHXCMMJ-rQzL+Jkn_9QNw5y6t4W+ADQATR1JWe_bWJjM3h+YDg@mail.gmail.com>
Message-ID: <20140306165435.GA3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-06 11:25 +0100, Samuel Martin spake thusly:
> On Wed, Mar 5, 2014 at 10:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > DL_DIR can be a very precious place for some users: they use it to store
> > all the downloaded archives to share across all their Buildroot (and
> > maybe non-Buildroot) builds.
[--SNIP--]
> > diff --git a/package/fis/fis.mk b/package/fis/fis.mk
> > index e9426a1..d10fdd2 100644
> > --- a/package/fis/fis.mk
> > +++ b/package/fis/fis.mk
> > @@ -6,7 +6,7 @@
> >
> >  FIS_SITE = http://svn.chezphil.org/utils/trunk
> >  FIS_SITE_METHOD = svn
> > -FIS_VERSION = 2892
> > +FIS_VERSION = 9852
> >
> >  define FIS_BUILD_CMDS
> >         $(TARGET_CC) $(TARGET_CFLAGS) -std=c99 -o $(@D)/fis \
> 
> This change seems not related to the rest of the patch! left over form
> your test maybe? ;-)

Yes, it's a leftover from some tests... Sigh...

Thanks for spotting this. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
