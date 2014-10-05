From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 11:17:35 +0200
Subject: [Buildroot] [PATCH 00 of 15] packages: rename FOO_BAR_OPT into
 FOO_BAR_OPTS
In-Reply-To: <20141004190749.2a9c9e31@free-electrons.com>
References: <patchbomb.1411846357@localhost>
 <20141004190749.2a9c9e31@free-electrons.com>
Message-ID: <20141005091735.GD4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas2, All,

On 2014-10-04 19:07 +0200, Thomas Petazzoni spake thusly:
> On Sat, 27 Sep 2014 21:32:37 +0200, Thomas De Schampheleire wrote:
> >   .mk files: remove alignment of line continuation characters
> >   .mk files: remove alignment of assignments
> 
> On those ones, I must say I'm not sure. Do we really have a coding
> style for line continuation characters? In some cases, I found the
> original code (i.e before your patch) to actually be nicer than after
> your change.

Well, I do like alignment of \, because it is easier to see the lines
are a single block.

But I prefer consistency.

> For the alignment of assignments, I generally agree, but:
> 
>  1/ I believe there should be exceptions to the rules. Especially
>  inside the package infrastructure themselves, aligning = signs is
>  sometimes good for readability
> 
>  2/ Your regex doesn't handle cases such as:
> 
> FOO         ?=
> BAR         ?= $(SOMETHING)
> 
>     The second assignment gets changed, but not the first one.
> 
> So on those last two patches, I'd like to have more community feedback.

Being consistent is nice. However, I find a bulk clean-up is very
complex to do:

  - as you found, some assignments were not cleaned-up; it is difficult
    to find a pattern that matches all cases, and has no false-positives;

  - it is difficult to review, because of the sheer amount of changes in
    a single patch.

So I would prefer we fix offenders whenever there is another patch being
done for it. For example, when a version is bumped, a preliminary patch
would introduce the cleanup (with the first two changes possibly being
conflated in a single patch if it is easy to review):

    foo: remove backslash alignment
    foo: remove assignments alignment
    foo: bump version

This is something very easy to do, and review.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
