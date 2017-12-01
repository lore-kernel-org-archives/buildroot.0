From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 1 Dec 2017 16:05:03 +0200
Subject: [Buildroot] Putting qtwebkit on a diet
In-Reply-To: <20171130090230.79cedfe7@windsurf.home>
References: <7f8d2d60-b870-61f1-df5e-ed83f9923c39@petroprogram.com>
 <56abbedc-c97e-46e6-5458-7b6c2b18ba18@petroprogram.com>
 <20171130090230.79cedfe7@windsurf.home>
Message-ID: <f7391a80-8158-7b15-b1ef-d6386982f426@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Allrighty then :-)

It get's even better. When enabling "optimize for size" feature and ARM
thumb2 (needed for optimize size on ARM platforms)
I could reduce QtWebkit size down to 7.6 MB ! :-)

I try to collect as many feature settings that I can find and then make
patch serie of 3 where:
- patch #1 let's user to disable/enable features individually
- patch #2 introduces quick setting, minimal to disable all features
leaving only the core of the webkit (enough for surfing? need to test)
- patch #3 exposes that optimize size feature

Besides disk and RAM savings I see a benefit of reducing unwanted/needed
features in terms of
?security and privacy (less code to exploit by bad guys).

-S-

Thomas Petazzoni kirjoitti 30.11.2017 klo 10:02:
> Hello,
>
> On Thu, 30 Nov 2017 01:49:28 +0200, Stefan Fr?berg wrote:
>> Update: I just tried it and the results are these:
>>
>> Stock, uclibc qt5webkit size on target:
>> 32MB
>>
>> Modified uclibc qt5webkit build with "minimal" and
>> "use_cross_platform_context_menus" (needed for successfull build)
>> settings, size on target:
>> 22 MB
>>
>> So it would save about 10 MB
> I think that's an interesting space saving (and perhaps build time
> saving as well ?). So yes, you can go ahead and submit patches to
> implement more fine-grained configuration for qt5webkit :-)
>
> Thanks!
>
> Thomas
