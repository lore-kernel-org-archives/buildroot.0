From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 22:50:49 +0100
Subject: [Buildroot] [PATCH v1 2/2] dhcp: disable isc assertions
 (reproducible builds)
In-Reply-To: <20180204095413.GA2411@scaer> (Yann E. MORIN's message of "Sun, 4
 Feb 2018 10:54:13 +0100")
References: <20171027192424.19760-1-ps.report@gmx.net>
 <20171027192424.19760-2-ps.report@gmx.net>
 <20180108211857.2166f95e@windsurf> <20180130175402.GA3468@scaer>
 <877ert20yj.fsf@dell.be.48ers.dk> <20180204095413.GA2411@scaer>
Message-ID: <87mv0owhja.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2018-02-03 22:54 +0100, Peter Korsgaard spake thusly:
 >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 > [--SNIP--]
 >> > Now, about reproducibility... We could at least pass -DFILE=\"\" and so
 >> > on from inside our gcc-wrapper, like we already do for __DATE__ and
 >> > __TIME__. Yes, that would give an empty filename in assertions and the
 >> > likes, but do we care in the end?
 >> 
 >> It would be nicer if we could pass basename($file), but that would break
 >> with compilations with multiple source files passed to gcc or header
 >> files, so yeah, perhaps that is the best way forward.
 >> 
 >> How does E.G. Debian handle it?

 > I could not find an authoritative source for this, but from what I could
 > hint from [0] (see the part about "Qt tests and __FILE__"), they do have
 > a patched gcc and a special dpkg which use the BUILD_PATH_PREFIX_MAP
 > environment variable as specified iby reproducible-builds.org [1].

 > Also, upstream gcc has an "in-progress" upstream solution being worked
 > on, based on BUILD_PATH_PREFIX_MAP, but they did not like it [2]...

 > [0] https://reproducible.alioth.debian.org/blog/posts/134/
 > [1] https://reproducible-builds.org/specs/build-path-prefix-map/
 > [2] https://gcc.gnu.org/ml/gcc-patches/2017-08/msg00232.html

Thanks - Looks interesting. I wasn't aware of this
BUILD_PATH_PREFIX_MAP.

-- 
Bye, Peter Korsgaard
