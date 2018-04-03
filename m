From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 20:10:37 +0200
Subject: [Buildroot] Per-package download folders and Git caching
In-Reply-To: <20180403174904.GE2335@scaer> (Yann E. MORIN's message of "Tue, 3
 Apr 2018 19:49:04 +0200")
References: <20180403141703.21cd24fe@windsurf>
 <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be>
 <876058qvi4.fsf@dell.be.48ers.dk> <20180403162324.GB2335@scaer>
 <87k1top74p.fsf@dell.be.48ers.dk> <20180403174904.GE2335@scaer>
Message-ID: <87fu4cp3du.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2018-04-03 18:49 +0200, Peter Korsgaard spake thusly:
 >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> > Should we do a cp if ln fails, then?
 >> That sounds like a sensible fallback, yes.

 > I was about to do so, but then we're back to a situation where we have
 > to guarantee the atomicity.

 > This is currently possible, because the dl-wrapper now runs under flock.
 > But we are going to optimise the locking with a more fine-grained
 > solution soonish.

Presumably we could copy to a temporary file and then rename like the
dl-wrapper already does?

-- 
Bye, Peter Korsgaard
