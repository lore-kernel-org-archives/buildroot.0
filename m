From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Nov 2017 21:49:01 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be> (Arnout
 Vandecappelle's message of "Sat, 4 Nov 2017 20:53:27 +0100")
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
Message-ID: <87bmkh4vnm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> This is with current master and make 4.1.

 >  But not when there is no .config file:

 > $ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH
 > /bin/sh: log: command not found
 > SOURCE_DATE_EPOCH=
 > /bin/sh: log: command not found

No, but that makes sense as there isn't a BR2_GIT setting, so moving the
assignment around won't fix that.

Having the SOURCE_DATE_EPOCH assignment fail when you don't have a
.config (and hence also no BR2_REPRODUCIBLE=y) is imho not a big deal.

 >  Solution: move the GIT definition to top-level Makefile.

Sorry, what does that fix? GIT comes from BR2_GIT, E.G. the .config.

 >> So I don't really agree that it useless. What we could perhaps do is to
 >> only export our value for SOURCE_DATE_EPOCH if not already set in the
 >> enviroment, so you can set it outside Buildroot if you want a different
 >> behaviour.

 >  Well, the proposed solution of using a config variable sounds OK. Only, I think
 > it would make more sense to have a config variable with a date, rather than a
 > commit ID.

Agreed, or simply only set SOURCE_DATE_EPOCH if it isn't already set in
the environment which imho is a more generic solution.

-- 
Bye, Peter Korsgaard
