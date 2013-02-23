From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 23:40:47 +0100
Subject: [Buildroot] [PATCH] new package: adns
In-Reply-To: <5129264A.3050807@petroprogram.com>
References: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
 <512900E0.9080605@mind.be> <5129264A.3050807@petroprogram.com>
Message-ID: <5129456F.2030603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/13 21:27, Stefan Fr?berg wrote:
[snip]
>>> diff --git a/package/adns/adns-1.4-ipv6.patch
>>> b/package/adns/adns-1.4-ipv6.patch
>>> new file mode 100644
>>> index 0000000..8d02257
>>> --- /dev/null
>>> +++ b/package/adns/adns-1.4-ipv6.patch
>>> @@ -0,0 +1,2725 @@
>>> +Add IPv6 support
>>> +Upstream-Status: Pending
>>
>>   Ditto.
>>
>>   Also, this looks like a feature patch, not a cross-build patch, so we
>> normally would not include it in buildroot...
>>
>
> Ok. Then these should be removed too from then current git
>
> avahi/avahi-ipv6only.patch
> avahi/avahi-optional-ipv6.patch
> iproute2/iproute2-optional-ipv6.patch
> libeXosip2/libeXosip2-fix-non-ipv6-build.patch
> libglib2/libglib2-optional-ipv6.patch
> x11vnc/x11vnc-ipv6.patch

  All these patches make it possible to build these packages in 
environments that don't have IPv6 support. I.e., they fix build errors.
Sometimes the build error is fixed by adding 'depends on BR2_INET_IPV6', 
but fixing the package is of course better.

  adns-1.4-ipv6.patch on the other hand adds support for IPv6. adns will 
build and run fine on all toolchains without this patch.

  Given that it's a huge patch as well, I tend to say we wouldn't want to 
carry it.

  However, the situation is not that black and white. With a dead 
upstream, the patch being maintained by Debian, and IPv6 functionality 
being quite essential, we could consider taking it.

  But there's a very easy workaround:

ADNS_PATCH = http://people.debian.org/~lucab/deb/adns/adns-ipv6.patch

and nobody will complain :-)

(Note that that won't work until patchwork 217122 is merged.)


[snip]
>>   BTW, is this patch really 4 years old? Does that imply that adns is
>> in fact dead?
>>
>
> Might be, but so are many other packages in buildroot too. Latest stable
> release of matchbox for example, is
> from 2007.

  I didn't mean to imply that we shouldn't take it in buildroot. I was 
just surprised.

  I took a look at the website and it looks like upstream is really dead.

  Regards,
  Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
