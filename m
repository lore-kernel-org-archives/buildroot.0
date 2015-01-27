From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 17:05:43 +0100
Subject: [Buildroot] [PATCH] alsa-utils: needs dynamic library support
In-Reply-To: <20150127132801.GJ3148@tarshish> (Baruch Siach's message of "Tue, 
 27 Jan 2015 15:28:01 +0200")
References: <27b7692b7892024566e160a09c2d49df8cb3481c.1422354073.git.baruch@tkos.co.il>
 <20150127135220.7832b906@free-electrons.com>
 <20150127132801.GJ3148@tarshish>
Message-ID: <871tmgyzs8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"
 >> 
 >> but in practice, alsa-lib does not necessarily depends on -ldl.

 > Indeed. Now I see that commit ffd7a00aef723 (alsa-lib: add patch to remove 
 > hardcoded -ldl) intended to fix that exact same issue. Though it seems like we 
 > need to AUTORECONF alsa-utils for this fix to take effect, isn't it?. Thomas 
 > (DS)?

Yes, as far as I can see we just need to autoreconf/gettextize
alsa-utils to get it to pick up the alsa-lib change.

-- 
Bye, Peter Korsgaard
