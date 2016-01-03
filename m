From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 22:33:03 +0100
Subject: [Buildroot] [PATCH] Add download helper for PyPi
In-Reply-To: <568842A5.6010103@mind.be> (Arnout Vandecappelle's message of
 "Sat, 2 Jan 2016 22:35:33 +0100")
References: <1451766174-7072-1-git-send-email-yegorslists@googlemail.com>
 <568842A5.6010103@mind.be>
Message-ID: <877fjqmjqo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 02-01-16 21:22, Yegor Yefremov wrote:
 >> PyPi has following URL structure:
 >> 
 >> https://pypi.python.org/packages/source/{first pkg name char}/{pkg name}
 >> 
 >> User only needs to pass package name to the helper. The helper itself
 >> extracts the first package name character and inserts it into download URL
 >> together with package name.
 >> 
 >> Usage example:
 >> 
 >> PYTHON_SIX_SITE = $(call pypi,six)

 >  The reason we introduced this variable for github was that github had changed
 > the direct URL a few times. For pypi, there is no such problem.

 >  In general, we prefer to keep things explicit, even if that is more verbose.
 > The $(call pypi,six) is nice and terse, but it makes it more difficult to
 > copy/paste the URL in your browser for instance.

 >  In short, I'm not too fond of this new helper.

I agree, if it doesn't buy us anything besides a little bit of typing
then I also prefer to stay explicit.

-- 
Bye, Peter Korsgaard
