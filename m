From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 05 Jan 2012 11:37:33 +0100
Subject: [Buildroot] [PATCH v5 3/6] New package: python-dpkt
In-Reply-To: <20120105111645.2caf8493@skate>
References: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
 <1325676605-31194-4-git-send-email-yegorslists@googlemail.com>
 <4F0577F1.9070604@free.fr> <20120105111645.2caf8493@skate>
Message-ID: <4F057D6D.6030500@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.01.2012 11:16, schrieb Thomas Petazzoni:
> Le Thu, 05 Jan 2012 11:14:09 +0100,
> Julien Boibessot <julien.boibessot@free.fr> a ?crit :
> 
>> Do somebody ever thought in doing a distutils package infrastructure 
>> that would make the adding of a new python package just a matter of:
>>      $(eval $(call DISTUTILSTARGETS))
>> (or something like that)
> 
> Yeah, we discussed that sometime ago. I think our conclusion was:
> "let's wait to have a few Python packages to see what are the common
> things and then we'll do an infrastructure". I guess we could merge
> Yegor's patches as is and then work on a common infrastructure.

I agree. These package can be merged as they are. In the patch series we have 3 packages all using different installation methods:

dpkt - uses internal distutils and ships no C code
mad - uses internal distutils but a part of it must be cross-compiled
netifaces - uses setuptools on top of distutils, has C code and uses distutilscross to get the code crosscompiled

in the future there will be one more internal tool ditsutils2 https://bitbucket.org/tarek/distutils2/overview

and Chris Lambacher is going to PyCon with following talk: https://us.pycon.org/2012/schedule/presentation/11/

So we should wait a little till the sings will calm down and then make our decision.

Best regards,
Yegor
