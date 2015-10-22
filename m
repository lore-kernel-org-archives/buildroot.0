From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Oct 2015 23:14:46 +0200
Subject: [Buildroot] [PATCH 01/21 v2] core: do not accept multiple
 definitions of a package
In-Reply-To: <20151022210922.GB3797@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <1996959fcee1f7bf71e9e8539fa2471fce6b1308.1445545973.git.yann.morin.1998@free.fr>
 <56294EC5.8070909@mind.be> <20151022210922.GB3797@free.fr>
Message-ID: <562951C6.4010508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-10-15 23:09, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-10-22 23:01 +0200, Arnout Vandecappelle spake thusly:
>> On 22-10-15 22:33, Yann E. MORIN wrote:
[snip]
>>> @@ -351,6 +359,7 @@ define inner-generic-package
>>>  $(2)_TYPE                       =  $(4)
>>>  $(2)_NAME			=  $(1)
>>>  $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
>>> +$(2)_PKGDIR			=  $(pkgdir)
>>
>>  Now we have this variable, it would be nice to replace all occurences of
>> $(PKGDIR) with $($(PKG)_PKGDIR) and remove the (IMHO ugly)

 BTW, an alternative is to to globally assign:

PKGDIR = $($(PKG)_PKGDIR)

then we can keep on using $(PKGDIR). But that probably is not really clear for
most developers...

>>
>> $$($(2)_TARGET_PATCH):                   PKGDIR=$(pkgdir)
>>
>> (obviously in a follow-up patch, which I might produce myself if I feel like it).
> 
> I already started doing so, jsut to see to what extent that would have
> an impact, but it is not ready at all.
> 
> I also wanted to replace every occurences of hard-coded paths like:
>     package/foo/my-file
> 
> with:
>     $(FOO_PKGDIR)/my-file
> 
> but this is an insane amount of work. I'll cary it if/when this patch is
> applied.

 I don't think it makes sense to make a mass change like that. If you want to
make a mass change, calculate some hashes :-)

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
