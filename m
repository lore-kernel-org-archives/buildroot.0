From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Nov 2020 18:14:35 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <20201107213231.GC3971474@scaer> (Yann E. MORIN's message of
 "Sat, 7 Nov 2020 22:32:31 +0100")
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
 <retd7hxdrv.ln2@ID-313208.user.individual.net>
 <20201105211232.GO2887157@scaer> <87y2jdxekx.fsf@dell.be.48ers.dk>
 <20201107213231.GC3971474@scaer>
Message-ID: <878sbbydms.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> I wonder if the gain is worth the extra complexity for our users and in
 >> the implementation.

 > The implementation is pretty trivial. I have more changes against the
 > manual than I have against the code...

yes, I was mainly referring to the first part, E.G. our users. Now the
hash lines are an algorithm prefix and then the output of <alg>sum, but
with the suggested change this is no longer the case.

But yes, it isn't a big complication.


 > However, now that I've read a bit more, especially that last article, I
 > doubt we'd be susceptible to such attacks. Indeed, LEA target MACs, that
 > is signatures. We're not using hashes that way; we just hash files, not
 > secrets.

I am not a cryptographer, but I would imagine that creating LEA attacks
against the kind of hashes we have is HARD to do, otherwise a lot of
things would break, and all those upstreams publishing hashes with their
releases would be for nothing.

-- 
Bye, Peter Korsgaard
