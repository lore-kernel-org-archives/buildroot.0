From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 11:13:02 +0100
Subject: [Buildroot] [PATCH 1/1] openipmi: add OPENIPMI_VERSION_MAJOR
 variable
In-Reply-To: <20151231103141.580e0bfc@free-electrons.com>
References: <1451548770-2968-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20151231103141.580e0bfc@free-electrons.com>
Message-ID: <5684FFAE.50701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-12-15 10:31, Thomas Petazzoni wrote:
> Jerzy,
> 
> On Thu, 31 Dec 2015 08:59:30 +0100, Jerzy Grzegorek wrote:
> 
>> -OPENIPMI_VERSION = 2.0.21
>> -OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
>> -OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
>> +OPENIPMI_VERSION_MAJOR = 2.0
>> +OPENIPMI_VERSION = $(OPENIPMI_VERSION_MAJOR).21
>> +OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
>> +OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%20$(OPENIPMI_VERSION_MAJOR)%20Library
> 
> I believe this is going a bit too far because what's encoded in the URL
> here is not really the "major version", but the name of the project,
> which is "OpenIPMI 2.0 Library".
> 
> So in this case, I don't think using the _VERSION_MAJOR thing is really
> appropriate.
> 
> Let's see what others think about it.

 I don't care much either way. In general, I'm not too impressed with the
introduction of _VERSION_MAJOR variables, because IMHO it doesn't simplify
things at all. The idea is that it would be easier to bump the version, but in
all likelihood, when the major version changes, you have bigger problems to deal
with than just having to change things in two places.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
