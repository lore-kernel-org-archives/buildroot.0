From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Dec 2017 23:15:42 +0100
Subject: [Buildroot] [PATCH] package/cmake: bump version to 3.10.0 and
 add license hash
In-Reply-To: <20171217173911.GA7491@scaer> (Yann E. MORIN's message of "Sun,
 17 Dec 2017 18:39:11 +0100")
References: <20171210233349.24682-1-mlang@blind.guru>
 <20171212070736.04953cff@windsurf.png.is.keysight.com>
 <20171212123040.35400bc4@windsurf> <877etnj677.fsf@home.blind.guru>
 <20171216133439.58247290@windsurf> <20171217173911.GA7491@scaer>
Message-ID: <87ind37kdt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Alternatively, we could also consider bumping our own requirements now,
 > requiring a newer base system.

 > Yes, that would mean leaving out in the cold people stuck on *very
 > ancient* enterprise-class distros (which IMHO would be a bit sad). But I
 > would prefer that rather than springling a dependency in all packages...

 > Unless we also build our own host toolchain? ;-] Well, probably a host
 > C/C++ compiler would be enough to build is needed, until we also need to
 > build binutils and a C library and whatnot... This should be avoided if
 > at all possible.

Argh, let's not go there! ;)

 > emplace_hint() has been added in gcc-4.7 (listed as a defect in 4.6).
 > However, some of the build failures are on a machine with gcc-4.7.2;

 >     http://autobuild.buildroot.org/results/ae8/ae88e2addefab8c7ccefa853c87313034ea241bc/build-end.log
 >     [--SNIP--]
 >     -- The C compiler identification is GNU 4.7.2
 >     -- The CXX compiler identification is GNU 4.7.2
 >     [--SNIP--]
 >     cmGlobalNinjaGenerator.cxx:1077:40: error: 'class std::map<const
 >     cmGeneratorTarget*, std::set<std::basic_string<char> > >' has no member
 >     named 'emplace_hint'

 > But all the failures occur on gcc-20...

 > I looke at my autobuilder, and it uses gcc-4.8.2, and cmake builds fine
 > with that...

 > gcc-4.8 was released in March 2013, which will be almost 5 years ago
 > when we tag LTS 2018.02. So maybe we can keep using cmake-3.9 up until
 > 2018.02, then update our requirements to require a host gcc >= 4.8m
 > which will allow us to bump cmake to 3.10.

 > I agree that, with time passing, more and more packages will require
 > C++11, so it will make sense to require proper C++11 support for the
 > host compiler.

Yes, maybe that is indeed the best way forward - Post 2018.02 that is.

-- 
Bye, Peter Korsgaard
