From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Nov 2009 17:20:44 +0100
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091120161925.GW919@mx.loc> (Bernhard Reutner-Fischer's message
	of "Fri\, 20 Nov 2009 17\:19\:25 +0100")
References: <20091007162422.GI10261@mx.loc> <20091009095152.555ceed2@surf>
	<20091009100008.7d0f2c65@surf> <20091009094809.GH2266@mx.loc>
	<87my40hkmz.fsf@macbook.be.48ers.dk>
	<87vdh5gxeh.fsf@macbook.be.48ers.dk> <20091120152853.GV919@mx.loc>
	<20091120161925.GW919@mx.loc>
Message-ID: <87iqd5gobn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> .. and of course keep DL_DIR

 Bernhard> so, to come back to my initial proposal

 Bernhard> # wipe target and staging dirs (think %-uninstall):
 Bernhard> clean:
 Bernhard> # remove generated files, retain: configs and DL_DIR, {m,}conf{,.o}, host-*:
 Bernhard> realclean:
 Bernhard> # remove generated files, including configs {m,}conf host-* (but not DL_DIR!):
 Bernhard> # think git clean -d -x
 Bernhard> distclean:

Check the tree. I believe the commit does that (except we don't have a
realclean).

 Bernhard> # make a release tarball; see how existing DL_DIR does not matter:
 Bernhard> dist release: FOO=buildroot VERS=1.2.3
 Bernhard> 	git archive --prefix $(FOO)-$(VERS) HEAD | tee >(bzip2>$(FOO).tar.bz2) >(gzip>$(FOO).tar.gz) | xv>$(FOO).tar.xv

I prefer to not touch make release right now - Not a high priority as
I'm the only one using it.


-- 
Bye, Peter Korsgaard
