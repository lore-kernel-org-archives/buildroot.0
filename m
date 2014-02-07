From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 07 Feb 2014 20:18:08 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <52F4DEB6.3040703@zacarias.com.ar>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate> <52F4DEB6.3040703@zacarias.com.ar>
Message-ID: <52F53170.9080007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/14 14:25, Gustavo Zacarias wrote:
[snip]
>>> >>    powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/399e62acf2c452653cb2ee9ca150a0cfe7e33326/
>> > 
>> > Missing setns() on CodeSourcery toolchain. Since util-linux is really
>> > needed for many packages, it would be good to find a fix that doesn't
>> > involve disabling util-linux completely.
>> > 
>> > checking for syscall setns... no
>> > configure: WARNING: Unable to detect syscall setns.
>> > configure: error: nsenter selected but setns syscall not found
>> > make: *** [/home/test/test/3/output/build/util-linux-2.23.2/.stamp_configured] Error 1
>> > 
>> > Gustavo, an idea?
> Yes, blame commit 9f91d79601da42516752318beecfd080dc05aac9
> Before it was an option util-linux decided if it was appropiate to build
> it according to setns() being available, now we may be forcing it when
> the syscall may simply be unavailable (like this toolchain).
> We can do a ton of toolchain kludges or just revert, i'd prefer the
> second option since it's not like a super-common command (actually most
> distros don't have it yet because it's pretty new for util-linux).


 Then instead, mark it as BROKEN with an explanatory comment, so it is
still lying around in case someone needs it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
