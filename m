From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 28 Jul 2015 16:00:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-27
In-Reply-To: <20150728105715.22962d48@free-electrons.com>
References: <20150728063018.ECCE8101BC0@stock.ovh.net>
 <20150728105715.22962d48@free-electrons.com>
Message-ID: <1438092036.1610.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2015-07-28 at 10:57 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> >          arm |                   cc-tool-0.26 | NOK | http://autobu
> > ild.buildroot.net/results/a4c057e0b1ab6a2ffd69b27f6f5a79f98eb040f6/
> 
> checking for Boost's header version... 
> configure: error: invalid value: boost_major_version=
> package/pkg-generic.mk:146: recipe for target 
> '/home/buildroot/build/instance-0/output/build/cc-tool
> -0.26/.stamp_configured' failed
> 
> J?rg, you have touched Boost/cc-tool recently, can you have a look?

The old version of boost.m4 currently included in cc-tool has an issue
with gcc5 (one of its tests fails due to the first change described in 
https://gcc.gnu.org/gcc-5/porting_to.html , "Preprocessor issues").

This was fixed upstream in Nov 2014:

https://github.com/tsuna/boost.m4/commit/32553aaf4d5090da19aa0ec33b9369
82c685009f

I'll update boost.m4 for cc-tool and submit a patch.

Best regards
J?rg Krause
