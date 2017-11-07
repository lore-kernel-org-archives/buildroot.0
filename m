From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Nov 2017 09:48:52 +0100
Subject: [Buildroot] [git commit] uboot: use local libfdt.h
In-Reply-To: <ff9910b0-ff51-4d4d-6f68-8fc7732c5273@mind.be> (Arnout
 Vandecappelle's message of "Mon, 6 Nov 2017 23:24:54 +0100")
References: <20171106201938.56CD37FC1A@busybox.osuosl.org>
 <ff9910b0-ff51-4d4d-6f68-8fc7732c5273@mind.be>
Message-ID: <87zi7yv5hn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 06-11-17 21:25, Peter Korsgaard wrote:
 >> +define UBOOT_FIX_LIBFDT_SYSTEM_PATH
 >> +	[ ! -e $(@D)/tools/fdtgrep.c ] || \

 >  Is there any reason to use [ ! ... ] || instead of [ ... ] && ?

You would need to add .. || true to not exit with a non-zero exit code
if the file doesn't exist (and stop make), so doing it like this is
shorter.

-- 
Bye, Peter Korsgaard
