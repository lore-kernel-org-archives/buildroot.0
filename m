From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 19 Oct 2011 11:37:17 -0500
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <20111019145934.68b77389@skate>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <201110191135.53268.arnout@mind.be> <20111019145934.68b77389@skate>
Message-ID: <201110191137.19358.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed October 19 2011, Thomas Petazzoni wrote:
> Le Wed, 19 Oct 2011 11:35:52 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
> >  The recent kernel.org horror has convinced me that some form of
> > verification is needed, though.
> 
> Having hashes in Buildroot will not necessarily provide an additional
> security. Consider the following scenario:
> 
>  1. The world exists.
>

Thomas, I can hardly keep myself from typing a smart remark here. 
;-)

>  2. Project foo releases foo-2.1.tar.bz2
>  3. A BR packager bumps package foo to 2.1. He downloads the new
>     tarball, generates locally its hash and adds this hash to the
>     foo.mk.
>  4. The BR packager patch is merged in Buildroot.
> 
> Having hashes in the foo.mk will warn you if the foo website has been
> cracked after step 3. But if it has been cracked between 2) and 3),
> then you're doomed: the BR packager will assume foo-2.1.tar.bz2 is
> correct. This packager will quite probably never check a GPG signature
> or do any kind of additional security check when bumping foo to 2.1.
> 

In my local, subjective, reality (#1) - - -

I post for re-distribution on one of my web sites archives built by
others (who don't provide signatures or even checksums).

When I post a package, I include the original posting link,
a checksum and a signature file.
But all that I can claim is that "if the signature matches, you
have got a true copy of what I posted" - which doesn't make any
claims that what I got was "correct" or the "intended" original.

From my server logs, it appears that it is an usual event for someone
to download either the signature or the checksum.
So in practice, it seems that few people bother to check.

> Therefore, I fear that this mechanism would give an *impression* of
> higher security, but would in fact provide no additional security
> compared to not verifying the hashes.
> 

When done further down the line of distribution than the original
creator of the package during package creation time...

It does give the "subjective impression" (see #1) that the poster
was following some sort of "best practices" in their re-distribution;
A "good thing".

But I have to agree that it also gives the impression that the contents
are still as the original packager intended;
Which could be a "bad thing".
For instance:
When troubleshooting a problem, having passed this "warm and fuzzy test"
it might be a long time before the user suspects that something is wrong
inside of the "trusted" package contents.

Add to the fact that few even bother to check...
I don't think it is worth the time and trouble to __add__ checksums and
signatures;
Although it would be a benefit to also archive any checksums and signatures
provided by the __original__ package creator.

Mike
> Thomas
