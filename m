From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Apr 2014 00:14:26 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <20140422221958.6240077e@skate>
References: <20140420063009.8B76B100DB9@stock.ovh.net>	<20140420104812.5bc926a9@skate>	<53569BBE.1020707@mind.be>
 <20140422221958.6240077e@skate>
Message-ID: <5356E9C2.9050900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/14 22:19, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Tue, 22 Apr 2014 18:41:34 +0200, Arnout Vandecappelle wrote:
> 
>>  I think there should be two changes to the autobuilders.
>>
>> - Reduce the % yes. With the growing number of packages, the number of
>> selected packages is also becoming unrealistically large.
> 
> True. Currently the KCONFIG_PROBABILITY is chosen between 1% and 35%.
> Should I reduce that to 30% ? 25% ?

 25% still means 300 packages, and I think that that doesn't even include
their dependencies. Isn't that exaggerated? I think that any defconfig
with more than 50 packages is not very realistic anymore...

 Also, the interesting failures (with missing dependencies) are more
likely to fall out when less packages are selected, right?

 So my suggestion is to reduce the probability to 15% (still 180 packages
in the defconfig...).

>> - If webkit is selected, increase the timeout with an hour. I don't know
>> how easy that is, though.
> 
> Not easy with the current horrible script, because the timeout is
> chosen in a shell script that runs the Python script that actually
> generates the configuration and runs the build.
> 
> So let's say that I'll reduce the KCONFIG_PROBABILITY on one side, and
> increase the timeout for all builds by an hour on the other side. How
> does that look?

 The timeout is already 4 hours, isn't it? That's already quite long IMHO.


 Regards,
 Arnout

> 
>>  It would of course be even better if the autobuilder would calculate the
>> timeout based on historical information from build-time.log, but I guess
>> that's a bit too ambitious :-)
> 
> Hmmm, sounds fun! But I'd prefer to keep the autobuilder logic smaller
> in size than Buildroot itself, if possible :-)
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
