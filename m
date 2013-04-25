From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Apr 2013 10:06:51 +0200
Subject: [Buildroot] [PATCH] fs/ubifs: factorize all the "depends on"
	into "if...endif" blocks
In-Reply-To: <5178E020.4050605@newflow.co.uk>
References: <5177D061.6020905@newflow.co.uk> <20130424212620.GC24710@free.fr>
 <5178E020.4050605@newflow.co.uk>
Message-ID: <201304251006.51436.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On Thursday 25 April 2013 09:49:52 Mark Jackson wrote:
> On 24/04/13 22:26, Yann E. MORIN wrote:
> > Comment the endif-s so we know at a glance to which if they belong to:
> > 
> > +endif # BR2_TARGET_ROOTFS_UBI
> > +
> > +endif # BR2_TARGET_ROOTFS_UBIFS
> 
> I *very* nearly put those in anyway, but checked with a few other Config.in files
> and none of them had such closing comments.

Yes, probably. Old code did not always follow this, especially when the
enclosed code blocks are small, or were small but later grew (which is very
often the case), and people going like "Oh I don't need to put a comment on
this closing conditional, it's just a few lines above. Oh, but now I added
three more lines. Oh, and now someone else added twenty more lines. And now
there is a new nested conditional block. Oh, and now the entire conditional
block no longer fits on a screen. Oh, now I'm lost...". ;-)

Which we should just avoid in the first place.

> > With that fixed:
> > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I'll post a v2.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
