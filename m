From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Feb 2018 11:56:08 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <20180205071820.GA2417@scaer> (Yann E. MORIN's message of "Mon, 5
 Feb 2018 08:18:20 +0100")
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <87bmh521a5.fsf@dell.be.48ers.dk> <20180204100444.GB2411@scaer>
 <CABa6e=otTJ1GiyhBA_hXXxNcyGts0TH5=CW=abBiwa5TageAHw@mail.gmail.com>
 <20180205071820.GA2417@scaer>
Message-ID: <87y3k7vh6f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Your patch set does the right thing WRT the debian install/clean, so all
 >> good, but I thought I'd mention this because it did not come up in any
 >> discussions here or in the linked docs.

 > OK, so we *do* have a Docker expert, now! ;-)

;)

 > Thank you for your explanations, that was very instructive. I gues
 > that's because aufs is used underneath, or something like that?

 > I would have expected that, instead of implicit, a layer would have been
 > explicit, like with a COMMIT keyword or something like that...

 > Anyway, it all makes sense in hindsight, indeed. Thanks!

One more thing to keep in mind, is that Docker expects the commands to
be idempotent, so docker will afaik cache each layer and reuse the cache
when you rerun the dockerfile later on and not actually execute those
commands:

https://thenewstack.io/understanding-the-docker-cache-for-faster-builds/

-- 
Bye, Peter Korsgaard
