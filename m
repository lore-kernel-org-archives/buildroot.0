From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 17:21:12 +0200
Subject: [Buildroot] [PATCH] package/sg3_utils: fix uclinux build
In-Reply-To: <1471196736-26143-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 14 Aug 2016 19:45:36 +0200")
References: <1471196736-26143-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87eg5ovixj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > sg3_utils grep for '^linux' as the host OS to decide if we are
 > targetting Linux.

 > However, on noMMU targets, the host OS can be 'uclinux' instead of just
 > plain 'linux', which make sg3_util confused and thus it forgets to
 > include soem source fiels in the build, resulting in link failures.

 > Fix that by ammending the regexp that recognises Linux. WE now need to
 > run autoreconf.

 > Fixes:
 >     http://autobuild.buildroot.org/results/79a/79a572f67bafa6a007256a5f22529c2daabd5733/
 >     http://autobuild.buildroot.org/results/4f7/4f7ea4bb4c4c12ceb9cd08bfb6720386f5bdea0b/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed after fixing the typospointed out by Arnout, thanks.

-- 
Bye, Peter Korsgaard
