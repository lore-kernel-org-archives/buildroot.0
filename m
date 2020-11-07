From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Nov 2020 18:27:10 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <20201105211232.GO2887157@scaer> (Yann E. MORIN's message of
 "Thu, 5 Nov 2020 22:12:32 +0100")
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
 <retd7hxdrv.ln2@ID-313208.user.individual.net>
 <20201105211232.GO2887157@scaer>
Message-ID: <87y2jdxekx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > So, I am not really sure how we can move forward...

 > If we were to add it, and were to make it mandatory that we be able to
 > validate them, then it would mean we would have to build our own
 > host-openssl prior to doing downloads. This is very not nice (see the
 > existing issue with host-tar, which we are trying to get rid of).

Indeed, lets not go there before a significant amount of upstreams start
to only provide sha3 hashes.


 > Franckly, my preference would got for the third option: not support sha3,
 > and add our own hashes. Adding our own hashes is anyway what we already
 > do for a lot of packages already. sha3 does provide extra resilience,
 > thanks to its novel design, but sha2 is still far from being considered
 > broken yet [0].

Agreed!

 > One thing we may consider adding to reinforce our robustness, is to
 > store the file size in the hash file, in addition to the hash, e.g.:

 >     sha256  c35d87f1d0...bbff51fe689  2439463  busybox-1.32.0.tar.bz2

 > This would protect against size-extension attacks, which afaiu are the
 > only attacks really considered for now against sha2 [1]...

 > And we could be backward compatible and recognise 3- or 4-field lines,
 > to decide whether the size is present of not, and not checking it in the
 > latter case.

I wonder if the gain is worth the extra complexity for our users and in
the implementation. Are there are any realistic size extension attacks
against sha256?

-- 
Bye, Peter Korsgaard
