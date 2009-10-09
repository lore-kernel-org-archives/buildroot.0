From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 13:28:04 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091009094809.GH2266@mx.loc> (Bernhard Reutner-Fischer's
	message of "Fri\, 9 Oct 2009 11\:48\:09 +0200")
References: <20091007162422.GI10261@mx.loc> <20091009095152.555ceed2@surf>
	<20091009100008.7d0f2c65@surf> <20091009094809.GH2266@mx.loc>
Message-ID: <87my40hkmz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> * On the clean target
 >> 
 >> I see that all the stamps are removed. So this will trigger
 >> basically a reconfigure + rebuild of all packages. Is this what we
 >> want ?

 Bernhard> yes, this is what i as a user would expect.
 Bernhard> Something broke, i have to rebuild stuff, so i
 Bernhard> make clean ; make

So in other words, we should just have clean and distclean, where the
only difference between those two is that clean doesn't delete your
.config?

 >> Same question as before: is removing the target/ directory without
 >> removing the staging/ directory really safe ?
 >> 
 >> Removing $(IMAGE) will not do anything, since $(IMAGE) is the prefix
 >> for the filesystem images. I.e, the tar image is $(IMAGE).tar.

 Bernhard> the IMAGE was there already. Ask Ulf what it was ment to be.

Ok, but lets really fix up stuff now that we're changing these things.


 >> Shouldn't we just remove $(BINARIES_DIR) ?

 Bernhard> works for me, but they have to be regenerated anyway, so not
 Bernhard> much point, i'd say.

They should imho get removed so the user doesn't get confused if the
build fails, but they still see (old) binaries in BINARIES_DIR.

But ok, moot point if we make clean remove everything.

-- 
Bye, Peter Korsgaard
