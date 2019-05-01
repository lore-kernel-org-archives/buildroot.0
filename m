From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 May 2019 14:37:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: fix python build
In-Reply-To: <027677af-1529-f480-7fe5-bf3788fac21e@mind.be> (Arnout
 Vandecappelle's message of "Wed, 1 May 2019 14:19:17 +0200")
References: <20190427134925.1730-1-fontaine.fabrice@gmail.com>
 <87ftq0ot5n.fsf@dell.be.48ers.dk>
 <027677af-1529-f480-7fe5-bf3788fac21e@mind.be>
Message-ID: <871s1iic56.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Hmm, I somehow missed the host/target mixup. This is not good. You test
 >> if the target python-ply package is enabled, but then add
 >> host-python-ply (which doesn't exist) to _DEPENDENCIES:
 >> 
 >> http://autobuild.buildroot.net/results/2615ebfdcb068594d028af4823260e613d37e867/build-end.log
 >> 
 >> If I understand it right, we need ply for the host to satisfy the
 >> configure check and ply for the target for runtime, so I guess the
 >> solution is to add a host version of the python-ply package.

 >  It's pretty ridiculous that we need host-python and host-python-ply *just* to
 > satisfy the configure script... AFAICS, it's not actually used anywhere. Can't
 > we turn PYTHON into a cache var and replace all that with a simple
 > ac_cv_PYTHON=pyhon ?

I guess we could, but it also needs python for the target at runtime, so
that implies host-python, and host-python-ply is a pure python package
so trivial to build - So it doesn't really gain much.

-- 
Bye, Peter Korsgaard
