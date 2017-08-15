From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 23:24:54 +0200
Subject: [Buildroot] can't build qt5webkit for raspberry pi 3
In-Reply-To: <20170815210235.3uvthq2bk5zoxluo@gportay>
References: <20170815114148.42777e85@brock-desktop>
 <20170815210235.3uvthq2bk5zoxluo@gportay>
Message-ID: <a6c22850-0224-c263-123d-197392f48615@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 23:02, Ga?l PORTAY wrote:
> Hello Brock,
> 
> On Tue, Aug 15, 2017 at 11:41:48AM -0600, Brock Williams wrote:
>> I'm not able to build qt5webkit for a pi 3 from master.  It works for pi
>> 2. Here is the error:
>>
>> In file included from ./config.h:30:0,
>>                  from wtf/CurrentTime.cpp:34:
>> ./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
>>  #    error "Not supported ARM architecture"
>>       ^~~~~
>>
>> I've attached the defconfig that we are using.  This is based on the
>> raspberrypi3_defconfig with what I think is just the minimum to build
>> qt5webkit added.  For now we have just configured
>> the build down to the pi 2 cpu settings.
>>
>> Brock
>>
> The CPU of rpi3 has moved from cortex-a8 (armv7) to cortex-a53 (armv8) in the
> raspberrypi3_defconfig. And Qt WebKit do not support for armv8.

 So we should add arch dependencies to qt5webkit, I guess. Are there more arches
that are excluded (but still allowed by jscore, so only arm, x86, mipsel)?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
