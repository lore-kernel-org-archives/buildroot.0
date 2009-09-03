From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 3 Sep 2009 22:17:21 +0200
Subject: [Buildroot] [git commit master] package: Remove unnecessary
 dependencies on uclibc.
In-Reply-To: <20090903185705.83F5B7776A@busybox.osuosl.org>
References: <20090903185705.83F5B7776A@busybox.osuosl.org>
Message-ID: <20090903201721.GE28419@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 03, 2009 at 08:22:38PM +0200, Peter Korsgaard wrote:
>
>commit: http://git.buildroot.net/buildroot/commit/?id=422ce6536b6d45e4632d526ae04c6af0bd36e80a
>branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>A C library will have been built by the toolchain makefiles, so there is no
>need for packages to explicitly depend on uclibc.

The effect is correct, but the reasoning is unfortunately inaccurate.
See BASE_TARGETS in the toplevel Makefile. Given that you strive to
support different libc's, you should apply (first one is basically the
above):

http://repo.or.cz/w/buildroot.git?a=commit;h=7a1e0eccede82028e176ee4671fe79b1a34c0779
http://repo.or.cz/w/buildroot.git?a=commit;h=567d5c24536c8462b6df24f6c7654a72b00f202d
http://repo.or.cz/w/buildroot.git?a=commit;h=ab606461d9033d8dca2dd698751308d9aa0c528f
http://repo.or.cz/w/buildroot.git?a=commit;h=31cb73c8370d65a2fde86415de59369dc433b02d
http://repo.or.cz/w/buildroot.git?a=commit;h=056295ebb496aaf941ffa36eeae5f6bf11b2c100
