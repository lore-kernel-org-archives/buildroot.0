From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue, 14 Sep 2010 11:40:53 +0200
Subject: [Buildroot] [PATCH 5/8] Use the normal download method for
 Tremor
In-Reply-To: <20100913191331.6742850f@surf>
References: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
	<91f2599d9b9f069f719f5577ae44d987ccd58649.1284360382.git.thomas.petazzoni@free-electrons.com>
	<1284367351.1742.29.camel@sven> <20100913105520.1a2ed8b8@surf>
	<1284392732.3216.54.camel@dubciaranr1.verifone.com>
	<20100913191331.6742850f@surf>
Message-ID: <20100914094052.GB9914@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Thomas Petazzoni <thomas.petazzoni@free-electrons.com> [2010-09-13 19:13:31]:

> I totally agree, but the current wget download method has exactly the
> same bug, so this problem is not a regression introduced by this patch
> set specifically.
> 
> Rather than trying to make this patch set perfect by trying to make it
> fix all bugs, I'd rather like to see it merged (it adds new features
> without removing any, and without introducing any regression, or at
> least, I hope).

I agree with Thomas, I think it's best to integrate this first patchset,
and then work on the issues that remain but are not directly introduced
by it.

> The issue you're raising being perfectly valid, I'd like to see it
> fixed some day. FWIW, I even proposed a fix back in April for exactly
> this problem on interrupt wget downloads
> (http://lists.busybox.net/pipermail/buildroot/2010-April/034014.html),
> but that fix got rejected due to implementation concerns. I didn't had
> the time since then to look into it. Obviously, help is very welcome to
> propose further patches to fix that issues for all of wget, git and svn
> download methods.

Sure. I think using temporary files is a good solution, as using hashes
doesn't play very well with Git/Svn downloads.

- Maxime
-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Linux kernel and software developer at MontaVista Software
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100914/0f5dcd02/attachment.pgp>
