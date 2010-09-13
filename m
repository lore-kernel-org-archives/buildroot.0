From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Sep 2010 19:13:31 +0200
Subject: [Buildroot] [PATCH 5/8] Use the normal download method for
 Tremor
In-Reply-To: <1284392732.3216.54.camel@dubciaranr1.verifone.com>
References: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
	<91f2599d9b9f069f719f5577ae44d987ccd58649.1284360382.git.thomas.petazzoni@free-electrons.com>
	<1284367351.1742.29.camel@sven> <20100913105520.1a2ed8b8@surf>
	<1284392732.3216.54.camel@dubciaranr1.verifone.com>
Message-ID: <20100913191331.6742850f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Quotient,

[ I suppose Quotient isn't your real first name, but anyway ]

On Mon, 13 Sep 2010 16:45:32 +0100
Quotient Remainder <quotientvremainder@gmail.com> wrote:

> Back a few months ago when Maxime (and Luca Ceresoli) first sent his
> patches to the list I took them on board and massaged them into
> something I could use on a daily basis and have had moderate success
> (I will share if anyone's interested).  One of the problems with the
> above patch is that if the "git archive" is interrupted (e.g. Ctrl-C)
> a half-finished tarball is left in $(DL_DIR).  Off you go again to
> "make" and DOWNLOAD sees that it has a "dl/package-version.tar.gz" ->
> I don't need to download that -> I'll extract that to
> "output/build/..." and then an error occurs when EOF is met
> unexpectedly.
> 
> Anyway, this fixes it: just archive to a tempfile and rename.

I totally agree, but the current wget download method has exactly the
same bug, so this problem is not a regression introduced by this patch
set specifically.

Rather than trying to make this patch set perfect by trying to make it
fix all bugs, I'd rather like to see it merged (it adds new features
without removing any, and without introducing any regression, or at
least, I hope).

The issue you're raising being perfectly valid, I'd like to see it
fixed some day. FWIW, I even proposed a fix back in April for exactly
this problem on interrupt wget downloads
(http://lists.busybox.net/pipermail/buildroot/2010-April/034014.html),
but that fix got rejected due to implementation concerns. I didn't had
the time since then to look into it. Obviously, help is very welcome to
propose further patches to fix that issues for all of wget, git and svn
download methods.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
