From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 00:25:27 +0200
Subject: [Buildroot] [PATCH] synergy: change upstream location to fix
 download issues
In-Reply-To: <20180903102655.6f7f8df4@windsurf>
References: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
 <871sab3v4l.fsf@dell.be.48ers.dk> <20180903102655.6f7f8df4@windsurf>
Message-ID: <1262e995-3152-4014-dad5-770f2e83a4ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/09/2018 10:26, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 03 Sep 2018 09:20:10 +0200, Peter Korsgaard wrote:
> 
>>  >  SYNERGY_VERSION = v1.8.8-stable
>>  > -SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
>>  > +SYNERGY_SITE = $(call github,symless,synergy-core,$(SYNERGY_VERSION))  
>>
>> So is the idea to apply this to next or to master? If we change the hash
>> for the 1.8.8 version, then this will break download for the 2018.02.x /
>> 2018.05.x releases.
> 
> My idea was to have it on master and next, but indeed I did not think
> about 2018.02.x/2018.05.x being broken :-/

 Wait, how are these broken? Quoting the commit message:

   On master as of 811734ef9044bbdfc067da76358153061fae2031, we use
   v1.8.8, which fails to download from github.com, so we fallback to
   sources.buildroot.net, which has the tarball.

>> Looking at the synergy git history, a hack could be to bump the version
>> to the commit just after v1.8.8 together with changing the URL so we end
>> up with a new tarball name:
>>
>> commit ec56ac4485ef8e3cf986107b8456949b5aec3527
>> Author: Andrew Nelless <andrew@symless.com>
>> Date:   Fri Mar 3 14:51:23 2017 +0000
>>
>>     Fix version number in Changelog
> 
> Or perhaps we simply don't fix it in master, and only in next ? The big
> downside I see with not fixing in master is that people who look at
> their build log will see the upstream download fail due to the hash
> mismatch, and the fallback to sources.buildroot.net.

 It's not a hash mismatch, it's a 404. So in my book, that's fine.

> A
> security-conscious user could rightfully think that Buildroot is trying
> to sneak in a backdoor in the synergy code by providing a different
> version on sources.buildroot.net than what upstream provides.

 Well, if upstream breaks their URLs, you can't expect things to keep working...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
