From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 16:50:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707131123.GC15840@mx.loc> (Bernhard Fischer's message of
	"Mon\, 7 Jul 2008 15\:11\:23 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk> <48720878.3070602@atmel.com>
	<20080707123642.GA15840@mx.loc> <487212CC.7020303@atmel.com>
	<20080707131123.GC15840@mx.loc>
Message-ID: <8763rh4ul1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> make source-check is _supposed_ to download all sources,
 Bernhard> regardless of whether or not the package exists
 Bernhard> locally. Keep in mind that it is ment to check if packages
 Bernhard> and patches are (still) downloadable or not and explicitely
 Bernhard> disregarding any local stuff to simulate what users will
 Bernhard> experience.

It is and it does.

 Bernhard> Perhaps the source-check target should consequently use a
 Bernhard> $(DL_DIR).check dir then. This would avoid breakage elsewhere.

I'm not following. We used to handle it by invoking make with the -B
option so the download target would get executed even if the file was
already downloaded. That broke with Makefile.autotools.in as it
uses shell checks instead of the dependency handling in make.

 Bernhard> Apart from that such a "log" target strikes me as unwarranted.
 Bernhard> Just
 Bernhard> $ (make) 2>&1 >& MY.log
 Bernhard> or
 Bernhard> $ nohup make &

 Bernhard> would a more sensible thing to do, IMHO.

Agreed.

-- 
Bye, Peter Korsgaard
