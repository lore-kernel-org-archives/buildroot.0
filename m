From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 22:27:25 +0100
Subject: [Buildroot] [PATCH 5/6] gst-plugins-ugly: add legal info
In-Reply-To: <564E47F9.1080404@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447850352-26299-5-git-send-email-gustavo.zacarias@free-electrons.com>
 <564CF7C8.3030901@mind.be> <564E47F9.1080404@free-electrons.com>
Message-ID: <564F903D.3000107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-11-15 23:06, Gustavo Zacarias wrote:
> On 18/11/15 19:12, Arnout Vandecappelle wrote:
> 
>> On 18-11-15 13:39, gustavo.zacarias at free-electrons.com wrote:
>>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>>>
>>> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>>> ---
>>>   package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
>>> b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
>>> index e8f2362..9662623 100644
>>> --- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
>>> +++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
>>> @@ -7,6 +7,8 @@
>>>   GST_PLUGINS_UGLY_VERSION = 0.10.19
>>>   GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
>>>   GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
>>> +GST_PLUGINS_UGLY_LICENSE = LGPLv2.1+
>>
>>   synaesthesia is GPLv2+ (and is always enabled)
>>
>>   All the rest is LGPLv2+...
>>
>>> +GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
>>
>>   ...except this file which is 2.1...
>>
>>   I guess there's a reason it's called ugly :-)
>>
>>
>>   Regards,
>>   Arnout
> 
> Hi Arnout.
> Actually it's more ugly, in fact tests/check/elements/xingmux.c is LGPLv2.1+ :)

 When checking licenses, I skip stuff in tests, docs, config, ... because we
don't build that.


 Regards,
 Arnout

> So i'm going for:
> 
> # COPYING is in fact LGPLv2.1, but all of the code is v2+
> # (except for one test, xingmux)
> GST_PLUGINS_UGLY_LICENSE = LGPLv2+, GPLv2+ (synaesthesia)
> 
> Since in general we don't ship/use tests.
> Regards.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
