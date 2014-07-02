From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 23:42:41 +0200
Subject: [Buildroot] [PATCH 03/14] pkg-infra: move the git download
	helper to a script
In-Reply-To: <20140702203748.GC9383@free.fr> (Yann E. MORIN's message of "Wed, 
 2 Jul 2014 22:37:48 +0200")
References: <cover.1404167061.git.yann.morin.1998@free.fr>
 <c270e9e49dbc69c08629893f7c5e8fa952e37da7.1404167061.git.yann.morin.1998@free.fr>
 <87fvijbx17.fsf@dell.be.48ers.dk>
 <20140702174430.3f1377ce@free-electrons.com>
 <CAAXf6LVZrM5ZUkAxvGPRuupq3f6_jWU+V6e=0-11UVd9XA1GKQ@mail.gmail.com>
 <20140702192243.20920b70@free-electrons.com>
 <CAAXf6LVqeyzx3oq7croUX+x0U7YeBBhmF5LSYCXyYX9+7M9RNw@mail.gmail.com>
 <20140702223122.72ccaf58@free-electrons.com>
 <20140702203748.GC9383@free.fr>
Message-ID: <877g3vbfou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> I think what Peter complains about is that with just PATCH 03/14
 >> applied, the Git download method no longer works properly as it leaves
 >> the repo in $(DL_DIR).

Indeed.

 >> The fact that this problem may or may not get solved by a later patch
 >> in the series is more-or-less irrelevant here:

 > Agreed. If that patch changes the behaviour, it is incorrect.

 >> Peter is just saying
 >> that the series is not perfectly bisectable, and he stopped reviewing
 >> when he saw an issue in PATCH 03/14.

 > And I do not see this issue...

Sorry, I got confused. The problem actually turned out to be the use of
pushd/popd with a /bin/sh, on here /bin/sh is dash which doesn't support
it.

The fix is to use !#/bin/bash

-- 
Bye, Peter Korsgaard
