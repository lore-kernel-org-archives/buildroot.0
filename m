From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 15:01:46 +0200
Subject: [Buildroot] [PATCH] Makefile: generate wrapper makefile when
	running make without a .config
In-Reply-To: <3fbe1d36-1909-634c-5f72-ea432d19f15a@mind.be> (Arnout
 Vandecappelle's message of "Mon, 3 Jul 2017 14:25:11 +0200")
References: <20170703102405.25977-1-peter@korsgaard.com>
 <3fbe1d36-1909-634c-5f72-ea432d19f15a@mind.be>
Message-ID: <8760f98yit.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 03-07-17 12:24, Peter Korsgaard wrote:
 >> The recent change to error out instead of running menuconfig when no .config
 >> is available broke an existing use case:
 >> 
 >> make O=output-foo; cd output-foo; br-init-conf (or similar to get a sensible .config); make
 >> 
 >> As there is no wrapper makefile in output-foo.
 >> 
 >> Fix it by ensuring the wrapper gets created if needed.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

 >  However, the br-init-conf script doesn't exist in utils/. Perhaps someone
 > should add it? :-P

True. Thomas wrote the script, but it very much depends on the
autobuilder toolchains, so probably it needs to be updated with the
changes we're doing now.

-- 
Bye, Peter Korsgaard
