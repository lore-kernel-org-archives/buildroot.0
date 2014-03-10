From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Mar 2014 07:43:13 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-03-07
In-Reply-To: <20140308150515.467d5568@skate>
References: <20140308073007.50AAF1016F2@stock.ovh.net>
 <20140308110454.GA3254@free.fr> <20140308150515.467d5568@skate>
Message-ID: <531D5F01.8080106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/03/14 15:05, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Sat, 8 Mar 2014 12:04:54 +0100, Yann E. MORIN wrote:
> 
>> On 2014-03-08 08:30 +0100, Thomas Petazzoni spake thusly:
>>> Detail of failures
>>> ===================
>>>
>>>       i686 |   CXX      Source/JavaScrip... | TIM | http://autobuild.buildroot.net/results/93a3e226f624bc389ad647014c070b66ac83de57/
>>
>> This one had been running for 12663 seconds, which is 3h 31min 3s at the
>> moment it _started_ building webkit.
>>
>> So, it looks like some of the random builds can run for more than the
>> limit of 4h.
> 
> Yes, it seems like some builds can actually take more than 4 hours on
> this machine. I would need to compare with Peter's configuration: my
> script picks a random number between 1 and 35, and uses that for the
> KCONFIG_PROBABILITY. So in some builds, it means that up to 35% of the
> BR2_PACKAGE_<foo> options can be enabled. Maybe it's too much?

 35% may be a bit too much, but it's good to have high numbers in there
as well. Some packages have a 'depends on'; with a per-option probability
of 10%, these would have a probability of only 1% to be selected...

 Maybe the timeout can be made to depend on the number of packages
selected in the .config? Like 5 minutes per package (and a minimum of 1
hour)?

 Or you could add an hour to the timeout if Webkit is selected...

> 
> The Free Electrons build server runs 3 Buildroot builds in parallel
> 24/7, and during the night, a Jenkins instance builds all the Buildroot
> defconfigs, which might load the machine even more. So for a given
> configuration, the build time may vary quite significantly due to the
> varying load of the machine.
> 
>> Of course, I'm not saying we should bump the limit. But this is a good
>> example of why saving build-time.log is useful! ;-)
> 
> Have you had a look at generating the build time graphs from such longs
> builds? They are completely unreadable :/

 The time graphs are unreadable, but it's actually the build_time.log
itself that is interesting. It's easy enough to visually look for big
time jumps in there, and to check how long it was running at the last
step. (For that, however, you have to rely on the timestamp of the files
on the autobuild server, i.e. when it was uploaded, not when the build
was actually aborted. It would be nice if the end-of-build timestamp was
also saved somewhere in an "official" way.)

> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
