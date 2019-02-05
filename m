From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 09:55:49 +0100
Subject: [Buildroot] [PATCH v5 04/10] testing/tests/download: add git
 hash test
In-Reply-To: <d27d3c06-dedf-7450-35fb-5bdf66845320@mind.be> (Arnout
 Vandecappelle's message of "Tue, 5 Feb 2019 09:09:38 +0100")
References: <3493f835-d2c0-5d07-b33a-9bfd746b57d8@mind.be>
 <5c58de45509b7_290e2ab5f544b97c12228@ultri5.mail>
 <d27d3c06-dedf-7450-35fb-5bdf66845320@mind.be>
Message-ID: <87a7jar4ve.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> Shouldn't we add a timeout here, just to be safe?
 >> 
 >> I think the expect() method uses the default from the class if not defined.
 >> And the default timeout for spawn is 30 seconds AFAICR.
 >> I did not double-checked the docs yet.

 >  I had only diagonally read the documentation and I saw that timeout in expect()
 > defaults to -1, so I assumed it was infinity... But in fact it indeed means
 > "inherit from the spawn class", and there it defaults to 30.

I got confused by that as well when I wrote the docker/compose
tests.

Notice that we set timeout to 5 in emulator.py:

   timeout=5 * self.timeout_multiplier

So I believe -1 means 5 seconds, not 30.

-- 
Bye, Peter Korsgaard
