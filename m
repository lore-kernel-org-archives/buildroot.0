From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 15:52:02 +0100
Subject: [Buildroot] The C++11 issue
In-Reply-To: <20150321102858.5e13ec41@free-electrons.com>
References: <20150321102858.5e13ec41@free-electrons.com>
Message-ID: <550D8592.5040300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/03/15 10:28, Thomas Petazzoni wrote:
> Hello,
> 
> A number of packages start to depend on C++11 features, which are not
> available in all toolchains: toolchains using old compiler versions
> (such as the Blackfin one), but also some older Crosstool-NG generated
> toolchains.

[snip]

> So how do we decide whether a particular toolchain has C++11 support ?
> Do we simply decide that gcc >= 4.8 have sufficient C++11 support for
> now, and we'll adjust things later if needed ?

 Given that:

- even gcc 4.9 could still have some missing libstdc++ features;
- C++14 is on the way;
- we only support gcc as a compiler,

I would say that instead of BR2_TOOLCHAIN_HAS_CXX11, we could use
BR2_GCC_AT_LEAST_4_X similar to the headers. That, at least, is unambiguous. It
has the additional advantage that sometimes we may need the version for some
things unrelated to C++, e.g. support for some compiler flags.

 It does require more Config.in symbols, but at the moment 4.8 and 4.9 are
probably sufficient. But then again, adding an additional symbol is not that
much work so I'd include 4.7 as well.


 BTW, now that bfin internal compiler is gone, can we deprecate 4.5?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
