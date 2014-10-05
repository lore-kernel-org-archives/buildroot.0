From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 13:07:44 +0200
Subject: [Buildroot] [PATCH 00 of 15] packages: rename FOO_BAR_OPT into
 FOO_BAR_OPTS
In-Reply-To: <20141005091735.GD4220@free.fr>
References: <patchbomb.1411846357@localhost>
 <20141004190749.2a9c9e31@free-electrons.com>
 <20141005091735.GD4220@free.fr>
Message-ID: <20141005130744.15148459@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 5 Oct 2014 11:17:35 +0200, Yann E. MORIN wrote:

> > On those ones, I must say I'm not sure. Do we really have a coding
> > style for line continuation characters? In some cases, I found the
> > original code (i.e before your patch) to actually be nicer than after
> > your change.
> 
> Well, I do like alignment of \, because it is easier to see the lines
> are a single block.

I also personally like the alignment of \, so I tend to disagree a bit
with the patch removing this.

Regarding the alignment of =, my point of view is that there are
different cases. Within packages, I agree it probably doesn't make much
sense to align = signs. However, within the core infrastructure, there
are situations where it really make seems more "beautiful" to read.


> Being consistent is nice. However, I find a bulk clean-up is very
> complex to do:
> 
>   - as you found, some assignments were not cleaned-up; it is difficult
>     to find a pattern that matches all cases, and has no false-positives;
> 
>   - it is difficult to review, because of the sheer amount of changes in
>     a single patch.
> 
> So I would prefer we fix offenders whenever there is another patch being
> done for it. For example, when a version is bumped, a preliminary patch
> would introduce the cleanup (with the first two changes possibly being
> conflated in a single patch if it is easy to review):
> 
>     foo: remove backslash alignment
>     foo: remove assignments alignment
>     foo: bump version
> 
> This is something very easy to do, and review.

I agree.

Summary: I mark as rejected those two patches?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
