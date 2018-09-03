From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Sep 2018 10:54:26 +0200
Subject: [Buildroot] [PATCH] synergy: change upstream location to fix
 download issues
In-Reply-To: <20180903102655.6f7f8df4@windsurf> (Thomas Petazzoni's message of
 "Mon, 3 Sep 2018 10:26:55 +0200")
References: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
 <871sab3v4l.fsf@dell.be.48ers.dk> <20180903102655.6f7f8df4@windsurf>
Message-ID: <87sh2r2c71.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 03 Sep 2018 09:20:10 +0200, Peter Korsgaard wrote:

 >> >  SYNERGY_VERSION = v1.8.8-stable
 >> > -SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
 >> > +SYNERGY_SITE = $(call github,symless,synergy-core,$(SYNERGY_VERSION))  
 >> 
 >> So is the idea to apply this to next or to master? If we change the hash
 >> for the 1.8.8 version, then this will break download for the 2018.02.x /
 >> 2018.05.x releases.

 > My idea was to have it on master and next, but indeed I did not think
 > about 2018.02.x/2018.05.x being broken :-/

 >> Looking at the synergy git history, a hack could be to bump the version
 >> to the commit just after v1.8.8 together with changing the URL so we end
 >> up with a new tarball name:
 >> 
 >> commit ec56ac4485ef8e3cf986107b8456949b5aec3527
 >> Author: Andrew Nelless <andrew@symless.com>
 >> Date:   Fri Mar 3 14:51:23 2017 +0000
 >> 
 >> Fix version number in Changelog

 > Or perhaps we simply don't fix it in master, and only in next ? The big
 > downside I see with not fixing in master is that people who look at
 > their build log will see the upstream download fail due to the hash
 > mismatch, and the fallback to sources.buildroot.net. A
 > security-conscious user could rightfully think that Buildroot is trying
 > to sneak in a backdoor in the synergy code by providing a different
 > version on sources.buildroot.net than what upstream provides.

s/not fixing in master/not fixing in master and 2018.0{2,5}.x/.

I guess the best solution is to bump to the git hash just after the
1.8.8 at the new upstream location (perhaps with a comment that this is
1.8.8) and apply that to all 3 branches.

I will do a last release of 2018.05.x in a week or 2 and mark it as EOL.

-- 
Bye, Peter Korsgaard
