From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Thu, 21 Mar 2013 19:06:13 +0100
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <514AAF05.80104@mind.be>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
 <20130310113224.4e3dbb2a@skate> <513C7DF2.9090005@googlemail.com>
 <5145CC2D.5020103@googlemail.com> <514AAF05.80104@mind.be>
Message-ID: <514B4C15.7080702@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, hello Thomas,

Am 21.03.2013 07:56, schrieb Arnout Vandecappelle:
>> This option is now not living anymore.
>>> --enable-sysfs          build with sysfs support [default=auto]
>>
>> The following options ([auto])are new.
>>> --enable-sysfs          build with sysfs support [default=auto]
> 
>   Er, I guess you made a mistake here? sysfs support is still an option?

Yes and no. :)
Yes, I made a copy & paste error, and No, the '-sysfs' option isn't
there in version 1.6.3.

>> I can try to rework this two files, but to save unneeded work any help
>> is appreciated. Can someone point me to the right direction?
> 
>   How it _should_ be is that as many configure options as possible are 
> specified explicitly in the .mk file. In particular, any configure option 
> that is set to the non-default value in the .mk file, should also be set 
> explicitly to the default value.

You mean for example
  --enable-svg            build SVG image provider [default=yes]
should be set by default to 'yes' and so on for the other 'default=yes'
options?
The options with default=auto should will be automaticly detected by
configure and mostly it isn't useful to explicitly deactivating them
because that breaks the binarys so leaving them.

>   But of course, a lot of that is not the case now, because the rule is 
> not strictly enforced. Anything you fix during the version bump is nice 
> to have, but you're not obliged to fix it if you don't know how to (and 
> we expect you to have tested the change, so that means trying out a 
> number of different configurations...).

Yes I can't test all variations so thats why I ask here how to do it
best. I'm working with a toolchain for a ARMv6 platform on a settopbox
there we need directfb so I test mostly of my work on this settopbox.

>   Regarding the cyber5k thing: that's indeed an oversight from when the 
> gfxdrivers options were added. Since nobody has complained about it, I 
> guess you can just remove the option. Or you can add it to Config.in, 
> whatever you like.

O.k. now it is a bit clearly to me. Hopefully I find some time on the
weekend to get into it. Thanks for your suggestions.

Regards
Carsten
