From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 18:10:18 +0200
Subject: [Buildroot] [PATCH] util-linux: Bump to version 2.32
In-Reply-To: <857898562.2094800.1527079548616.JavaMail.zimbra@datacom.com.br>
 (Carlos Santos's message of "Wed, 23 May 2018 09:45:48 -0300 (BRT)")
References: <20180521191623.7049-1-tpiepho@impinj.com>
 <1526938480.31570.89.camel@impinj.com>
 <877enwis89.fsf@dell.be.48ers.dk>
 <857898562.2094800.1527079548616.JavaMail.zimbra@datacom.com.br>
Message-ID: <871se1dogl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 >> From: "Peter Korsgaard" <peter@korsgaard.com>
 >> To: "Trent Piepho" <tpiepho@impinj.com>
 >> Cc: "buildroot" <buildroot@buildroot.org>
 >> Sent: Monday, May 21, 2018 7:00:54 PM
 >> Subject: Re: [Buildroot] [PATCH] util-linux: Bump to version 2.32

 >>>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:
 >> 
 >> Hi,
 >> 
 >> > Nevermind, I see I missed this change already being on buildroot/next.
 >> > If anyone wonders why mke2fs blocks for 2 seconds getting a filesystem
 >> > UUID on recent kernels on low boot entropy systems, it's because of the
 >> > problem described here.
 >> 
 >> I actually also hit this on 4.14.39 recently. Perhaps we should include
 >> this bump (or better just the getrandom changes) on master and on
 >> 2018.02.x?
 >> 
 >> Care to send a patch for master?

 > Isn't it simpler to cherry-pick commit 4b54bd3ae8, instead?

First of all, 4b54bd3ae8 is already on master so the question is just
what we do for 2018.02.x?

Just cherrypicking the bump to 2.32 is certainly the easiest, but
perhaps also riskier than just cherry-picking the getrandom() changes:

git shortlog v2.31.. -- lib/randutils.c
Carlo Caione (1):
      lib/randutils: Do not block on getrandom()

Karel Zak (1):
      lib/randutils: don't break on EAGAIN, use usleep()

On the other hand, util-linux bumps are normally quite safe and we have
not had any issues reported, so perhaps we should just go for 2.32 for
2018.02.x as well?

-- 
Bye, Peter Korsgaard
