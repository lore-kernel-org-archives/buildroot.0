From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 21:57:24 +0100
Subject: [Buildroot] [PATCH 00/11] support/download: fix scp and
 reintroduce source-check
In-Reply-To: <CAAXf6LVUvjymZVheDA2ihJ5ifmrB26p2d0Hm2aeaV3UahEOG=Q@mail.gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103214654.435a7043@windsurf>
 <CAAXf6LVUvjymZVheDA2ihJ5ifmrB26p2d0Hm2aeaV3UahEOG=Q@mail.gmail.com>
Message-ID: <20190103215724.708547d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Ricardo in Cc.

On Thu, 3 Jan 2019 21:54:19 +0100, Thomas De Schampheleire wrote:

> > Indeed, I believe the scp download method is rarely used and tested. The
> > only solution to not break it again is to have proper tests for it in
> > support/testing/. Should it be part of your patch series ? :-)
> 
> But how to generically test it? It requires a configured ssh server, which
> is not even guaranteed on localhost.

I am not sure. A dummy SSH server ? Or do the build with a fake scp
command in the PATH, which verifies it has the expected arguments, and
emulates what scp would do ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
