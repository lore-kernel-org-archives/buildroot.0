From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 09:19:21 +0200
Subject: [Buildroot] [git commit] czmq: unbreak static linking
In-Reply-To: <CAKAx1ciU57KJKuZoQ+vTT5muE9tTM+kVgKF1wMzOq6D-L6xs4w@mail.gmail.com>
 (Lionel Orry's message of "Wed, 13 May 2015 07:44:23 +0200")
References: <20150512184711.BDF2381DA3@busybox.osuosl.org>
 <20150512210011.4ed7af1d@free-electrons.com>
 <87a8x9h9uw.fsf@dell.be.48ers.dk>
 <20150512223405.595a8139@free-electrons.com>
 <87617xh2tt.fsf@dell.be.48ers.dk>
 <CAKAx1ciU57KJKuZoQ+vTT5muE9tTM+kVgKF1wMzOq6D-L6xs4w@mail.gmail.com>
Message-ID: <871tilgd1i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Orry <lionel.orry@gmail.com> writes:

Hi,

 >> Ahh, now I get it. Yes, fixing libzmq.pc to have a Libs.privat: -lstdc++
 >> should also work.
 >> 
 >> I'll give it a try.

 > I agree, the libzmq.pc needs to be fixed. It is not specific to czmq
 > but to all software components which statically link against libzmq
 > but are not necessarily written in C++.
 > I have this issue on other projects and I manually add '-lstdc++'.

Ok, good.

I've sent a patch doing that upstream as it has now been accepted:

https://github.com/zeromq/libzmq/pull/1398

And I've added it to buildroot as well.

-- 
Venlig hilsen,
Peter Korsgaard 
