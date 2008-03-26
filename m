From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2008 22:41:48 +0100
Subject: [Buildroot] using of local dir
In-Reply-To: <032301c88f86$de33de70$060514ac@atmel.com> (Ulf Samuelsson's
	message of "Wed\, 26 Mar 2008 21\:36\:02 +0100")
References: <47EA8F05.8090102@gmx.net> <20080326180926.GA404@mx.loc>
	<877ifp1bzg.fsf@macbook.be.48ers.dk>
	<032301c88f86$de33de70$060514ac@atmel.com>
Message-ID: <87hcetyxgj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> It indeed seems quite broken. The $LOCAL variable isn't used
 >> anywhere either.

 Ulf> Check "project.mk"

Ahh. Why isn't the variable set there if it's only used in project.mk
anyway?


 Bernhard> *shrug* I'd rip it out in a whim either way
 >> 
 >> Well, the local/save/getconfig stuff does seem kinda overengineered -
 >> Couldn't we just have a bunch of *_defconfig files under configs/
 >> instead with a make %_defconfig target like the kernel has instead?
 >> 

 Ulf> The purpose of this is to allow you to start with an existing
 Ulf> defconfig, and the commands will collects the different
 Ulf> configurations in one place.  You can't replace this function
 Ulf> with defconfigs, but you can use the result to create new
 Ulf> defconfigs.

 Ulf> At this time, not having access to the source tree, I can't see why LOCAL
 Ulf> is defined *after* the include, so maybe this needs to be moved.
 Ulf> Feel free to test.

No thanks - You made the mess, and you get to clean it up.

<grumpy-mode>

I really think we need to focus on getting the basic functionality of
buildroot stable and working so we can put out a release instead of
adding (what atleast looks like) half baked extensions.

</grumpy-mode>

-- 
Bye, Peter Korsgaard
