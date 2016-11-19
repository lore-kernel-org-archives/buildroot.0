From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 09:33:02 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <20161118222823.155c12a2@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-5-git-send-email-jezz@sysmic.org>
 <20161118124008.2b7a3178@free-electrons.com>
 <28c618b1c91a0df16af32645666e7198@sysmic.org>
 <20161118142945.60adccd8@free-electrons.com>
 <b762049e2698fa9e52f43abd5571d6a2@sysmic.org>
 <20161118222823.155c12a2@free-electrons.com>
Message-ID: <6d2cdd59-09d2-8545-3524-a3c32e7f2840@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 22:28, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Nov 2016 14:44:50 +0100, J?r?me Pouiller wrote:
> 
>>> Yes, I know, but it's a pain to force everyone using an old distro to
>>> build host-tar. Maybe we should make this conditional on
>>> BR2_REPRODUCIBLE?  
>>
>> Last Ubuntu LTS is 16.04 and Debian 9 will be stable in a few months 
>> (maybe simultaneous with next Buildroot version).
>>
>> So, IMHO it not justified to add a dirty condition in check-host-tar.sh.
> 
> I think you don't really realize how big companies work. They will be
> using such version in 3 or 5 years maybe.
> 
> We have people still using RHEL5, even though it's almost 10 years old,
> and its support going to stop next year. Supporting old distributions
> is important for Buildroot, so you can't just sweep away the problem by
> pretending that it doesn't exist with modern distributions.

 I'm absolutely with Thomas on this one.

 Also, it doesn't have to be very dirty. In check-host-tar.sh the major_min and
minor_min can be passed as arguments, and in check-host-tar.mk we can do

ifeq ($(BR2_REPRODUCIBLE),y)
TAR_VERSION_MIN = 1 28
else
TAR_VERSION_MIN = 1 17
endif
ifeq (,$(call suitable-host-package,tar,$(TAR) $(TAR_VERSION_MIN))
...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
