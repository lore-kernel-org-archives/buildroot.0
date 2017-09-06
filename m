From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 13:18:51 +0200
Subject: [Buildroot] [PATCH V2] bcusdk: eibd: drop local clock_gettime
	in USB backends
In-Reply-To: <1503695470-27811-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 (Kurt Van Dijck's message of "Fri, 25 Aug 2017 23:11:10 +0200")
References: <1503695470-27811-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <87fuc0f52c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

 > clock_gettime is defined locally, and calls pth_int_time, which
 > in turn calls clock_gettime.
 > The USB backend shouldn't overrule clock_gettime in the first place.
 > This patch fixes this endless recursion by removing the local defition.

 > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
