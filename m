From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 08:33:40 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: export PATH
In-Reply-To: <20131115205317.GG3337@free.fr> (Yann E. MORIN's message of "Fri, 
 15 Nov 2013 21:53:17 +0100")
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
 <1384203586-17790-7-git-send-email-s.martin49@gmail.com>
 <20131111233113.2e11fd88@skate>
 <CAHXCMMJnox5o3hfiVgj2vzK=1=pbm85cF+9Jutth-4LRvLB5CA@mail.gmail.com>
 <20131115205317.GG3337@free.fr>
Message-ID: <87mwl3zdm3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> To me, this could make easier writing post-{build,image} scripts.

 > Indeed, it *is* usefull for those scripts.

 > The first thing I do in br.config is to exactly set PATH to include the
 > host/usr/bin and host/usr/sbin directories in front of the user's PATH.

 > But maybe we should just set PATH at the time we call them?

I *THINK* always adding those host directories to the path would be
safe, as long as it happens after 'which' calls in the toplevel
makefile. This would also allow us to get rid of HOST_PATH / TARGET_PATH
(which are currently not identical, but should be).

But it will need some testing.

-- 
Bye, Peter Korsgaard
