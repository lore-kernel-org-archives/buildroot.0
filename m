From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 23:00:23 +0100
Subject: [Buildroot] [RFCv3 15/15] core: implement per-package SDK and
 target
In-Reply-To: <CANQCQpb780bRRaSkUnV2aTFg=1LjZ9f3tD-YYCOTN4au2F965A@mail.gmail.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-16-thomas.petazzoni@free-electrons.com>
 <CANQCQpb780bRRaSkUnV2aTFg=1LjZ9f3tD-YYCOTN4au2F965A@mail.gmail.com>
Message-ID: <c73b59f2-50a3-ca86-6859-3ad101d6b1ee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 15:45, Matthew Weber wrote:
[snip]
> 
> Using this patchset without any -j.  I found a case with host-setools
> where it uses the python-package framework to build and using
> setuptools puts a default -I<abs
> path>/per-package/host-python/host/include.  Previously this would
> have pointed at the full sysroot so now there is a missing include.

 There should also be a -I<abs path>/per-package/host-setools/host/include
because that's in HOST_CFLAGS. Or does this get hardcoded by setuptools?

 BTW, I guess the problem is that it fails to find libselinux or libsepol includes?

 Regards,
 Arnout

> I've added it for setools and continued on testing at this point.  I'm
> unsure if we would consider this a pkg-python.mk update or each
> package.....
> 
> Matt
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
