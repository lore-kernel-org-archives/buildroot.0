From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Aug 2013 16:20:34 +0200
Subject: [Buildroot] [PATCH] redis: fix build with ccache enabled
In-Reply-To: <c0967e3e463dd286cb2b.1377697225@argentina> (Thomas De
 Schampheleire's message of "Wed, 28 Aug 2013 15:40:25 +0200")
References: <c0967e3e463dd286cb2b.1377697225@argentina>
Message-ID: <87ppsxhp71.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Some parts of redis fail to build when ccache is enabled, due to one of our
 Thomas> own patches. The construct
 Thomas>     make CC=$(CC) target1 target2
 Thomas> would result in
 Thomas>     make CC=ccache <tuple>-gcc target1 target2

 Thomas> and here <tuple>-gcc would be treated as a target and the compiler used
 Thomas> would be just 'ccache'.

 Thomas> Reported-by: Johan Sagaert <sagaert.johan@skynet.be>
 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Thomas> ---
 Thomas> I think this should still be applied for 2013.08.

Committed, thanks.

-- 
Bye, Peter Korsgaard
