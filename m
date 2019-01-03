From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Jan 2019 22:41:13 +0100
Subject: [Buildroot] [PATCH 03/11] support/download: reintroduce
 'source-check' target
In-Reply-To: <20190103211742.GC5991@scaer> (Yann E. MORIN's message of "Thu, 3
 Jan 2019 22:17:42 +0100")
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-4-patrickdepinguin@gmail.com>
 <20190103211742.GC5991@scaer>
Message-ID: <87tvipo1vq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > But still, at some point, you will want your CI to actually test the
 > change, so you will need to have the stuff downloaded... So, why can't
 > you simply use 'make source && make' ? It would (mostly) have the actual
 > result you are looking for: do the check that everything is available,
 > and if it is, then the build can proceed. If something was missing, that
 > would have bailed out early.

 > The only thing that differs with source-check, is that the network will
 > actually be used (boohoo!).

 > However, since we added local cache for git, you would not need to fetch
 > much. Also, tarballs (from wget et al) were already cached locally. Of
 > course, that means you'd have to have BR2_DL_DIR in your envioronment,
 > pointing to a dl location that is persistent...

 > What is missing (guess it) is a local cache for Hg. I started working on
 > it a while ago (rght after the git cache was merged), but dropped it as
 > I had no way to throughly test it.

 > So, if you are really concerned about not exhausting your internal
 > network that much (I know some companies have slow links between remote
 > sites, so I understand [0]), what about you provide an Hg caching like
 > we have for git instead? ;-)

 > So, I am definitely not convinced by the need for source-check...

Agreed. Thomas, can you explain in more detail why you think
source-check is needed?

-- 
Bye, Peter Korsgaard
