From: Martin Bark <martin@barkynet.com>
Date: Tue, 05 Aug 2014 21:50:28 +0100
Subject: [Buildroot] [PATCH 1/3] ladspa-sdk: new package
In-Reply-To: <20140804222345.65aacf17@free-electrons.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>
 <20140804222345.65aacf17@free-electrons.com>
Message-ID: <53E14394.2030309@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas,

On 04/08/14 21:23, Thomas Petazzoni wrote:
> Dear Martin Bark,
>
> Sorry for the lack of feedback until now on these patches. See below
> for a number of comments.

That's fine, to be honest I forgot I submitted these patches :)

>
> On Thu, 24 Apr 2014 22:19:42 +0100, Martin Bark wrote:
>> LADSPA is a standard that allows software audio processors and
>> effects to be plugged into a wide range of audio synthesis and
>> recording packages.
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> First, looking at LADSPA, it seems like there has been no releases
> since 2007 or so. Is this still actively developed and used? Googling
> around, I've seen mentions of a new thing called LV2 which would be a
> LADSPA replacement.

Originally I started this because I wanted an equaliser for some work i 
was doing with acoustic echo cancellation. alsaeqaul was a quick easy 
way to add a equaliser i could change real time.  alsaequal needs caps 
which is an ladsp module hence the 3 patches.

I don't know if ladsp is under active development.  Really it's just the 
definition of an API in a C header file so I think it's not meant to 
change.  It's the packages like caps which implement the interface which 
i expect to be active.

caps is self contained (it includes a copy of ladsp.h) and does not need 
this ladsp-sdk package, i added it for completeness.

Is the lack of development activity an issue?  I could drop ladsp-sdk if 
you like.  Please let me know your thoughts.

Thanks

Martin
