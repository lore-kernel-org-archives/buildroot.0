From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Aug 2017 09:36:01 +0200
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <20170817090941.1c8f98fe@windsurf>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <CANQCQpbHChJOk0=8Mo0U==BRdYRL9=W9kwxkJFZAK=bCXx944A@mail.gmail.com>
 <83b89591-a9f6-8df5-ab5b-5d244fb87708@mind.be>
 <CANQCQpZ34VDsBhnZjTdaCrc=-pn0HgYvGs-S1oHXKhRA=uJPGA@mail.gmail.com>
 <CANQCQpa+hXqae9hXk52+Ne0JBpTGUby5NSNnm2MyHma+cDHRew@mail.gmail.com>
 <20170817090941.1c8f98fe@windsurf>
Message-ID: <828a6672-affa-650d-76f5-fa351686fea6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-08-17 09:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 16 Aug 2017 21:00:26 -0500, Matthew Weber wrote:
> 
>>>  I think it's best to put the empty _SITE check in an
>>> ifneq ($(BR2_PRIMARY_SITE_ONLY),y)
>>
>> https://patchwork.ozlabs.org/patch/802290/
> 
> I know this is what Arnout suggested, but I'm not sure it's my
> preferred fix. Indeed, what about instead dropping the:
> 
> if !BR2_PRIMARY_SITE_ONLY
> ...
> endif
> 
> condition in Config.in that encloses the definition of BR2_GNU_MIRROR,
> BR2_LUAROCKS_MIRROR, etc. ?
> 
> Even though I agree such variables are not used when
> BR2_PRIMARY_SITE_ONLY=y, I don't see why we hide them. Removing this
> condition in Config.in avoids the need for adding another condition in
> pkg-generic.mk, and it seems more logical to me.

 Works for me.

 Matthew, sorry for the bad suggestion :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
