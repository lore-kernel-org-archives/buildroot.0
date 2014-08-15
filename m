From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Aug 2014 00:23:08 +0200
Subject: [Buildroot] [PATCH] manual: Add atomic intrinsics to the
 dependencies section
In-Reply-To: <20140816001725.27388fce@free-electrons.com>
References: <20140803113216.03e0fb94@free-electrons.com>
 <1407154628-12791-1-git-send-email-Anton.Kolesov@synopsys.com>
 <20140816001725.27388fce@free-electrons.com>
Message-ID: <20140815222308.GC27341@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Anton, All,

On 2014-08-16 00:17 +0200, Thomas Petazzoni spake thusly:
> On Mon,  4 Aug 2014 16:17:08 +0400, Anton Kolesov wrote:
> > diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> > index 93e6a3e..4b4d056 100644
> > --- a/docs/manual/adding-packages-directory.txt
> > +++ b/docs/manual/adding-packages-directory.txt
> > @@ -265,6 +265,10 @@ use in the comment.
> >  ** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
> >  ** Comment string: +dynamic library+
> >  
> > +* Atomic intrinsics
> > +** Dependency symbol: +!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS+
> > +** Comment string: +atomic intrinsics+
> 
> Actually, the more I think about this, and the more I believe it should
> be a property of the architecture rather than a property of the
> toolchain. So it should probably rather be
> BR2_ARCH_HAS_ATOMIC_INTRINSICS. And then, since it's a property of the
> architecture, i.e not something the user can enable/disable, there is
> no point in adding Config.in comment for that. So we would handle that
> like we handle BR2_USE_MMU, not like we handle BR2_LARGEFILE.
> 
> Thoughts?

Ah, I remember now, that we talked about that. My bad, I had forgotten
during the review.

However, we can't really change the implementation now, we're frozen for
the release.

What about adding this to the manual for now, since it does reflect the
current status of the code, and switch to an architecture option in
-next, or after the release is cut?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
