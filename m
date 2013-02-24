From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 24 Feb 2013 13:01:50 +0200
Subject: [Buildroot] [PATCH] new package: adns
In-Reply-To: <5129456F.2030603@mind.be>
References: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
 <512900E0.9080605@mind.be> <5129264A.3050807@petroprogram.com>
 <5129456F.2030603@mind.be>
Message-ID: <5129F31E.2070204@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

24.2.2013 0:40, Arnout Vandecappelle kirjoitti:
> On 23/02/13 21:27, Stefan Fr?berg wrote:
> [snip]
>>>> diff --git a/package/adns/adns-1.4-ipv6.patch
>>>> b/package/adns/adns-1.4-ipv6.patch
>>>> new file mode 100644
>>>> index 0000000..8d02257
>>>> --- /dev/null
>>>> +++ b/package/adns/adns-1.4-ipv6.patch
>>>> @@ -0,0 +1,2725 @@
>>>> +Add IPv6 support
>>>> +Upstream-Status: Pending
>>>
>>>   Ditto.
>>>
>>>   Also, this looks like a feature patch, not a cross-build patch, so we
>>> normally would not include it in buildroot...
>>>
>>
>> Ok. Then these should be removed too from then current git
>>
>> avahi/avahi-ipv6only.patch
>> avahi/avahi-optional-ipv6.patch
>> iproute2/iproute2-optional-ipv6.patch
>> libeXosip2/libeXosip2-fix-non-ipv6-build.patch
>> libglib2/libglib2-optional-ipv6.patch
>> x11vnc/x11vnc-ipv6.patch
>
>  All these patches make it possible to build these packages in
> environments that don't have IPv6 support. I.e., they fix build errors.
> Sometimes the build error is fixed by adding 'depends on
> BR2_INET_IPV6', but fixing the package is of course better.
>
>  adns-1.4-ipv6.patch on the other hand adds support for IPv6. adns
> will build and run fine on all toolchains without this patch.
>
>  Given that it's a huge patch as well, I tend to say we wouldn't want
> to carry it.
>
>  However, the situation is not that black and white. With a dead
> upstream, the patch being maintained by Debian, and IPv6 functionality
> being quite essential, we could consider taking it.
>
>  But there's a very easy workaround:
>
> ADNS_PATCH = http://people.debian.org/~lucab/deb/adns/adns-ipv6.patch
>
> and nobody will complain :-)
>

That would be good :-)
And that ipv6 patch is also nicely -p1 level too.

That patch download mechanism needs really a support for multiple patch
levels.
Otherwise it's usefullness will only allow -p1 level patches to be
applied from Net .

For example it could first try with -p0, then if failed with -p1.
Also fuzz level could start from -F3 (default in patch?) and go up until
-F4, -F5 or maybe even -F6.

I think this is what gentoo patch framework does and that's why their
patches are happily mixed and matched.


> (Note that that won't work until patchwork 217122 is merged.)
>
>
> [snip]
>>>   BTW, is this patch really 4 years old? Does that imply that adns is
>>> in fact dead?
>>>
>>
>> Might be, but so are many other packages in buildroot too. Latest stable
>> release of matchbox for example, is
>> from 2007.
>
>  I didn't mean to imply that we shouldn't take it in buildroot. I was
> just surprised.
>
>  I took a look at the website and it looks like upstream is really dead.
>

That would explain why no response from upstream to my messages.
Originally I wanted this package to be optional dependency for Baruch's
wireshark
(which seems to be in good condition now).

And now I just noticed that wireshark added option in 2009 to use another
asynchronous dns implementation too than adns, c-ares.
So latest wireshark can still use either adns or c-ares but adns seems
really dead now.

Damn :-(

Regards
Stefan
