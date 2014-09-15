From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 15 Sep 2014 14:41:57 +0000
Subject: [Buildroot] [PATCH] ARC: gcc - Fix SIZE_TYPE to be "unsigned
 int" instead of long unsigned int"
In-Reply-To: <20140915162914.079b3507@free-electrons.com>
References: <1410787585-20387-1-git-send-email-abrodkin@synopsys.com>
 <20140915155052.1b3283ae@free-electrons.com>
 <1410790003.5875.33.camel@abrodkin-8560l.internal.synopsys.com>
 <20140915162914.079b3507@free-electrons.com>
Message-ID: <1410792116.5875.43.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-09-15 at 16:29 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon, 15 Sep 2014 14:06:43 +0000, Alexey Brodkin wrote:
> 
> > > > diff --git a/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
> > > > new file mode 100644
> > > > index 0000000..78d4b10
> > > > --- /dev/null
> > > > +++ b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
> > > 
> > > Patch lacks a description + SoB.
> > 
> > Well first of all IMHO patch name is self-explanatory.
> > Than I didn't want to duplicate the same text in commit message and in
> > patch itself.
> > 
> > If you think this is helpful I will happily add the same text and URL in
> > the patch.
> > 
> > Let me know what do you think about it.
> 
> We have a stupid rule, and stupid rules are meant to be complied
> with :-)

Understood - uniformity is good even if the rule itself is not that
good :)

> Joke aside, I think what you mentioned in the commit log is useful:
> what the patch does, and the fact that it's already "upstream" and
> therefore should be dropped at the next version bump of the ARC gcc
> compiler.

Funny enough that initially I had the same comment in the patch itself,
but while looking at output of "git format-patch" I found myself a bit
frustrated - if I were a reviewer I would say that submitted "full"
patch looks ridiculous.

Then I removed comment from commit message. That made me think that you
guys won't apply a patch that won't show any useful info in git log. 

So I decided to move a message to the Buildroot commit. This made sense
for me because at least when I bump version of a package I look at
history of this package and this way try to figure out what's still
required and what's not.

Moreover looking at the next folder "package/gcc/4.9.1" I found that
half of patches don't have any comment inside, some have URLs to
bugs/commits in GCC, some are full-scale patches with verbose
description.

Now you may understand my frustration.

Anyways, I'm about to send v2 with comments in both commit message and
patch itself.

Thanks for your time.

-Alexey
