From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Apr 2021 21:23:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/genext2fs: bump to version 1.5.0
In-Reply-To: <70d40419-5b26-453a-e806-ab47d9f22e1b@mind.be> (Arnout
 Vandecappelle's message of "Fri, 16 Apr 2021 09:33:15 +0200")
References: <20210414214439.1381969-1-fontaine.fabrice@gmail.com>
 <016dd397-3ae8-d6af-c3f8-8a88d72bedb0@mind.be>
 <b37de2fb-72ef-f5c0-b714-8fae2b4956e0@yandex.ru>
 <70d40419-5b26-453a-e806-ab47d9f22e1b@mind.be>
Message-ID: <87wnsyxen2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> ? I guess for stable, the patch [1] should be backported rather than bumping. But
 >>> is it worth spending effort on that for a borderline package like genext2fs?
 >> I tried really hard (before
 >> reporting the above bug)
 >> to find the equivalent
 >> functionality in mkfs.ext[24],
 >> and I think its simply not there.
 >> I think only genext2fs allows
 >> to set the perms for the root
 >> node, so I am not sure why it
 >> is borderline.

 >  Because on the target, you can generally simply do an mkfs directly of the
 > partition, then mount it, then set permissions and/or populate it as needed.
 > Even the mkfs from busybox is usually sufficient on target.

 >  Of course, Buildroot lives for borderline cases :-). But specifically for the
 > stable branches, I don't think it's very cost-effective to spend time on making
 > them work, unless there's a user who does the effort (because they actually need
 > it).

So in case the above is unclear, could you please do a backport of the
patch (and verify that it works) and send a patch for the LTS branch
(2021.02.x)?

-- 
Bye, Peter Korsgaard
