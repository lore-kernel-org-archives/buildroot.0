From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 13 Jun 2013 10:10:53 -0500
Subject: [Buildroot] [PATCH v10 08/13] gst1-plugins-base: add gstreamer1
 base plugins
In-Reply-To: <51B95F64.1050105@mind.be>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
 <1370647138-26623-9-git-send-email-spenser@gillilanding.com>
 <51B81371.3050109@mind.be>
 <CAEBucnB6iVqt4A6muV9ouwpqk4Npmd7Uu7SkNDrr3myGk_9Mnw@mail.gmail.com>
 <51B95F64.1050105@mind.be>
Message-ID: <CAEBucnA=rBWMdAWvQcDia924ZkQ28-JjJLA50_v3P51kE0wqdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

>>>> +comment "plugins with external dependencies (there may be more
>>>> available)"
>>>
>>>
>>>
>>>   What does "there may be more available" mean?
>>
>>
>> I've updated the wording to "plugins which have unpackaged
>> dependencies are not shown" .
>
>
>  I think that will make the line too long so you'd have to split it. But
> actually, for other packages we never say things like that.
>

The more I look at this the more I believe it should be removed.  It
was a hold over from the gst-plugins-base package.  I'll remove it
from the next patch series instead of the previously mentioned
explanation.

>
>>>> +# freetype is only used by examples, but if it is not found
>>>> +# and the host has a freetype-config script, then the host
>>>> +# include dirs are added to the search path causing trouble
>>>> +GST1_PLUGINS_BASE_CONF_ENV =
>>>> +       FT2_CONFIG=/bin/false \
>>>> +       ac_cv_header_stdint_t="stdint.h"
>>>
>>>
>>>
>>>   Why is this necessary?
>>
>>
>> Not sure, this was in the gst-plugins-base and was simply copied to
>> gst1-plugins-base.
>>
>> The following two commits created these lines.
>>
>> http://git.buildroot.net/buildroot/commit/package/multimedia/gst-plugins-base/gst-plugins-base.mk?id=8232850c51e07b99ba84769b492faa147290fdc7
>>
>> http://git.buildroot.net/buildroot/commit/package/multimedia/gst-plugins-base/gst-plugins-base.mk?id=32d319e6f7242553c821c7a1eadfabd2719f5992
>
>
>  I was only referring to the stdint - the other one has a proper comment.
>
>  But since nothing seems to have changed in the stdint.h detection code
> since 0.10.25, I guess it's best to keep it.
>

Sounds good to me.

>>>   I would actually make configure options for ximagesink and xvimagesink
>>> (--enable-x and --enable-xvideo).
>>
>>
>> As X already consumes a large amount of
>
>
>  I can complete that sentence :-)
>
>  Fair enough.

Oops, forgot to include the rest there but the point does get across
in not to many words! :)  Hopefully, I can get a second opinion on
this but X is not a package you include on a bare minimal system;
therefore, IMHO it's probably more important to implicitly enable
support rather than explicitly.

>>>   It would be nice if the plugins below could be kept alphabetic.
>>
>>
>> How about if I keep them in the order of ./configure --help?  That way
>> its easy to spot when new ones are added and old ones removed.
>
>
>  Yes, good idea.

Thanks, I'll make these adjustments in the next patch series. Thanks
for the review!

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
