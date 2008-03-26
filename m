From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2008 22:34:10 +0100
Subject: [Buildroot] build problems
In-Reply-To: <032601c88f86$e52e3720$060514ac@atmel.com> (Ulf Samuelsson's
	message of "Wed\, 26 Mar 2008 22\:15\:04 +0100")
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA8184@mtsexchange.dc.multitech.prv>
	<034f01c88ece$ef015bf0$040514ac@atmel.com>
	<87ve39buzq.fsf@macbook.be.48ers.dk>
	<032601c88f86$e52e3720$060514ac@atmel.com>
Message-ID: <87lk45yxt9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> I see that the directory only has a busybox config for 1.6.1 and
 >> 1.9.1, so it's broken anyway if the user selects anything else than
 >> that.

 Ulf> Yes, and then the user is responsible for creating a
 Ulf> configuration for that.  The current tree will modify the
 Ulf> configuration of an existing .config file without warning the
 Ulf> user, which is even more broken.

.. Because the hidding magic in the Makefile is broken. The config
option is called BR2_BUSYBOX_VERSION_1_9_X instead of 1_9_1 for a
reason.

 >> 
 >> To me it doesn't make sense to keep earlier versions than the latest
 >> stable release of a given major version (E.G. 1.9.2 instead of 1.9.1)

 Ulf> What you are saying here is that you do not want to allow people
 Ulf> to decide for themselves when they should upgrade the busybox version.
 Ulf> I think a lot of project managers would have an issue with this.

Exactly - Just like all the other packages we have.

Buildroot lives and evolves over time (and it has to). If you want a
static config, just don't change your buildroot snapshot.

-- 
Bye, Peter Korsgaard
