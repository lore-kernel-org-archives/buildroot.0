From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 20:00:49 +0200
Subject: [Buildroot] SDL directfb dependence [was: Re: svn
	commit:	trunk/buildroot/package/sdl]
In-Reply-To: <1185557906.12803.24.camel@elrond.sweden.atmel.com>
References: <20070725173927.E0BE0A5E25@busybox.net>
	<20070725223934.GB11697@aon.at>
	<1185407250.5580.17.camel@elrond.sweden.atmel.com>
	<6311fe0b0707251806x6e13d50dpefddd8ab6cc2a646@mail.gmail.com>
	<00a401c7cf52$629f3f60$dcc4af0a@atmel.com>
	<20070727161620.GD25147@aon.at>
	<1185557906.12803.24.camel@elrond.sweden.atmel.com>
Message-ID: <20070727180049.GC11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 27, 2007 at 07:38:26PM +0200, Ulf Samuelsson wrote:
>fre 2007-07-27 klockan 18:16 +0200 skrev Bernhard Fischer:
>> On Thu, Jul 26, 2007 at 08:55:57AM +0200, Ulf Samuelsson wrote:
>> >>> The SDL compile failed since "directfb.h" could not be found
>> >>> so I made the assumption, that it was neccessary.
>> >>> Maybe I was wrong, but if it is not required, why the error message?
>> >>>
>> >>>
>> >>> > If you want directfb and directfb-support, the you should select it
>> >>> > manually, no?
>> >>>
>> >>> Best Regards
>> >>> Ulf Samuelsson
>> >>>
>> >
>> >> DirectFB is not required.
>> >> SDL only needs the directfb.h header to build, in case directfb might be
>> >> invoked later at run time.
>> >> directfb is not used by default by SDL
>> >> 
>> >> 
>> >> -Rex
>> >> 
>> >
>> >OK, so we need to download the DirectFB and install its headers.
>> >SDL won't build in buildroot, unless we do.
>> 
>> Can you check if a
>> ifndef ($(BR2_PACKAGE_DIRECTFB),y)
>> 	$(SED) "/directfb.h>/d" all/odd/files/*
>> endif
>> 
>
>Sounds dangerous to me.
>What happens if you build SDL first, and then enables DirectFB?

yea, this wouldn't work out too well.
>
>I am thinking more along the line to create a new target
>"directfb-headers" in the package/directfb/directfb.mk.

Sounds like a good plan.
thanks,
