From: Richard Braun <rbraun@sceen.net>
Date: Thu, 14 Jun 2012 10:33:35 +0200
Subject: [Buildroot] [PATCH 7/7] automatically set PARALLEL_JOBS when
 BR2_JLEVEL is 0
In-Reply-To: <4FD921C9.4020302@mind.be>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
 <1339466983-19786-8-git-send-email-ntl@pobox.com>
 <4FD921C9.4020302@mind.be>
Message-ID: <20120614083335.GA15879@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 14, 2012 at 01:27:05AM +0200, Arnout Vandecappelle wrote:
>  In my experience, you need 2 times the number of CPUs to fully utilize
> the processor because most compilations have long iowait latencies.

Unless you have little memory, this is no longer true, and as some
compilations can eat a lot of memory, doubling their number reduces the
amount of available page cache, potentially increasing the amount of
I/O. Using the number of available processors should be just fine.

-- 
Richard Braun
