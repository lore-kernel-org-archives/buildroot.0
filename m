From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 23:21:58 +0200
Subject: [Buildroot] RTAI math module compilation
In-Reply-To: <CAEqQue108OTCsmAejX1sR6q8HL2zCj7jXtaB927b=kHo=UQTrA@mail.gmail.com>
References: <CAEqQue108OTCsmAejX1sR6q8HL2zCj7jXtaB927b=kHo=UQTrA@mail.gmail.com>
Message-ID: <78c4ab72-52be-571c-e81a-a0f78c1e2e7f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 18:50, servo gmrt wrote:
> Hi,
> 
> Anybody compiled rtai in buildroot-2016.02 version ?

 Unfortunately RTAI is a kernel extension so it doesn't get tested by the
autobuilders...


> Other than "rtai_math.ko" all the modules compiles without error. When I include
> math module for compilation, I am getting the following error,
> 
> The part of the make error log I attached with that.
> 
> Help me to resolve the issue.
> 
> 
> In file included from /usr/include/features.h:365:0,
>                  from ../rtai-4.0.1/base/include/rtai_math.h:37,
>                  from ../rtai-4.0.1/base/math/libm.c:24:
> /usr/include/sys/cdefs.h:236:0: warning: "__attribute_const__" redefined
  ^^^^^
 It is using headers from the host, which is very wrong.


 Perhaps we should remove RTAI. The most recent patch for x86 is 3.8, and the
most recent patch for ppc is 2.6.29... Oh, and there is a new version 5.0-test2
released in May that goes up to 4.1 for x86 (and drops ppc).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
