From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 May 2016 17:23:56 +0200
Subject: [Buildroot] [PATCH] x264: needs mmu
In-Reply-To: <1462193087-19193-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 May 2016 09:44:47 -0300")
References: <1462193087-19193-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87inywqy9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Uses madvise() which is not available in NOMMU. Fixes:
 > http://autobuild.buildroot.net/results/837/837fd5a63d59b5c65818ec005a565cb7741a1cdd/

Hmm, is that really generally true? I don't quite see why you cannot
have madvise() without mmu. Looking at uClibc-ng, the option enabling
madvise support doesn't depend on MMU support.

-- 
Bye, Peter Korsgaard
