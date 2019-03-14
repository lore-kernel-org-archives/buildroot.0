From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Mar 2019 08:27:56 +0100
Subject: [Buildroot] [RFC v1] package/gst1-plugins-bad: add webrtcbin
 option
In-Reply-To: <20190313201733.5ac6fb18@gmx.net>
References: <20190310175109.13444-1-ps.report@gmx.net>
 <20190312222745.06cf1b34@windsurf>
 <71e0a8c0-0809-e02c-cb29-25b2771202bd@mind.be>
 <20190313201733.5ac6fb18@gmx.net>
Message-ID: <25dda2d4-51f8-b20f-9dcd-32584bb0f194@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/03/2019 20:17, Peter Seiderer wrote:
> Hello Arnout,
> 
> On Wed, 13 Mar 2019 10:05:19 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 12/03/2019 22:27, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> +Arnout in Cc, our Config.in.legacy/backward-compatibility guru.
>>>
>>> On Sun, 10 Mar 2019 18:51:09 +0100
>>> Peter Seiderer <ps.report@gmx.net> wrote:
>>>   
>>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>>> ---
>>>> Notes:
>>>>   - just compile tested yet
>>>>   - named webrtcbin option (instead of webrtc), because of the
>>>>     BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC entry in Config.in.legacy
>>>>     (see [1] for history)  
>>>
>>> Would it be a big problem to reuse the
>>> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC option ?  
>>
>>  I believe the plugin got a different name, and is used in a different way. So
>> reusing the same option could lead to things that stop working - if it's a
>> different name, at least there is still the legacy warning.
>>
>>  That said, in -bad API changes sometimes happen anyway, so maybe we shouldn't
>> worry too much about that.
> 
> The history is there is a webrtcdsp plugin in gst1-plugins-bad which
> was (false) named simple webrtc in buildroot and was renamed (with a legacy
> entry) to webrtcdsp. Since gstreamer-1.12.x there is an 'real' additional/new webrtc
> plugin in gst1-plugins-bad (nothing to do with -bad API changes, just a
> buildroot history problem)...

 OK, I minsunderstood...

 The Config.in option was introduced in 2017.02, and renamed for 2017.08.

 However, the rename was also backported to 2017.02.4.

 In other words, the only people who could be hit by this issue are people that
used 2017.02 and never upgraded even to 2017.02.4.

 I think it's OK if we risk breaking something for those people. Especially
because the problem is very obvious and very easy to fix.


> 
> Two possibilities:
> 
> A) add a new buildroot option with the right name (and delete the legacy entry?)

 In other words, go for this option (and indeed delete the legacy entry).

 Regards,
 Arnout

> 
> B) add a new buildroot option with the wrong name webrtcbin instead of webrtc,
>    but avoid the legacy entry problem (as the suggested RFC patch does)
> 
> 
> Regards,
> Peter
> 
>>
>>  Regards,
>>  Arnout
>>
> 
