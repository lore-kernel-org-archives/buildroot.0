From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Apr 2018 10:56:43 +0200
Subject: [Buildroot] [PATCH v3 4/5] support/scripts/pkg-stats-new: add
 latest upstream version information
In-Reply-To: <5abdafb9f40dc_40bd3f9b153831d819346@ultri4.mail> (Ricardo
 Martincoski's message of "Fri, 30 Mar 2018 00:32:09 -0300")
References: <20180323205455.24789-5-thomas.petazzoni@bootlin.com>
 <5abdafb9f40dc_40bd3f9b153831d819346@ultri4.mail>
Message-ID: <87o9iym3p0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

Hi,

 > There is a lot of tutorials and articles in the wild saying this is the way to
 > go. After some digging online I think most of these articles are incomplete.
 > This seems to be a more complete article about these modules:
 > https://christopherdavis.me/blog/threading-basics.html

 > But then I tested the module multiprocessing.
 > IMO it is the way to go for this case.
 > See below the comparison.

 > 1) serialized requests:
 >  - really simple code
 >  - would take 2 hours to run in my machine

 > 2) threading + Queue:
 >  - lots of boilerplate code to work properly
 >  - 20 minutes in my machine

 > 3) multiprocessing:
 >  - simpler code than threading + Queue
 >  - 16 minutes in my machine
 >  - 9 minutes in the Gitlab CI elastic runner:
 > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/60290644

 > The demo code is here (a commit on the top of this series 1 to 4):
 > https://gitlab.com/RicardoMartincoski/buildroot/commit/dc5f447c30157499cd925c9e79c7bc9c29252219

 > Of course, as any solution, there are some downsides.
 >  - Pool.apply_async can't call object methods. There are solutions to this using
 >    other modules, but I think the simpler code wins. We just need to offload the
 >    code that runs asynchronously to helper functions. Yes, like you did in a
 >    previous iteration of the series.
 >  - more RAM is consumed per worker. I did a very simple measurement and htop
 >    shows 60MB per worker. I don't think it is too much in this case. I did not
 >    measured the other solutions.

 > Can we switch to use multiprocessing?

I'm far from a Python expert, but it certainly sounds sensible to me! Thomas?

-- 
Bye, Peter Korsgaard
