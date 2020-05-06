From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 09:39:40 +0200
Subject: [Buildroot] [PATCH] packages/exim: enable parallel make
In-Reply-To: <26ba2f56-3ac7-3364-848c-4d0cd3a8c9a3@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 6 May 2020 09:09:39 +0200")
References: <20200420163645.17803-1-luca@lucaceresoli.net>
 <87wo5pbo14.fsf@dell.be.48ers.dk>
 <26ba2f56-3ac7-3364-848c-4d0cd3a8c9a3@lucaceresoli.net>
Message-ID: <87o8r1bjgj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi Peter,
 > On 06/05/20 08:00, Peter Korsgaard wrote:
 >>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
 >> 
 >> > Parallel make used to be broken in exim, as reported in its docs. Now that
 >> > line has disappeared from the docs, and parallel make is actually working.
 >> 
 >> > Tested with 'make exim-dirclean ; time make BR2_JLEVEL=999 exim': builds
 >> > still succeed and the build time decreases from 34 to 11 seconds on my
 >> > host.
 >> 
 >> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 >> > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> 
 >> Committed to 2020.02.x, thanks.

 > Does this patch really belong to a stable branch?

I agree that it is a gray zone. Given that there weren't any followup
fixups on master since then (or so I thought, it turned out my tree was
not uptodate) I found it "safe".

 > If it does, then you should also apply [0] or we'll start seeing
 > parallel build failures on 2020.02.x too.

 > [0]
 > https://git.busybox.net/buildroot/commit/?id=8c75f95e0a3d2600015be5564ee9fe9393d95ebc

I'll do so later today. Yann also pointed that out to me.

-- 
Bye, Peter Korsgaard
