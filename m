From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 13:25:11 +0200
Subject: [Buildroot] libintl static linking issues - yet another spin
In-Reply-To: <20170403130149.6ccffe4e@free-electrons.com>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
 <20170328222525.005b27bb@free-electrons.com>
 <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
 <20170403130149.6ccffe4e@free-electrons.com>
Message-ID: <b2eb7b3c-1205-a1c1-fdd2-bfb1bafcfa66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-04-17 13:01, Thomas Petazzoni wrote:
> Hello,
> 
> [ Not read/thought about the entire e-mail yet, but just one point ]
> 
> On Mon, 3 Apr 2017 12:42:21 +0200, Arnout Vandecappelle wrote:
> 
>>  However, thinking a bit more about it: if libintl support disappears from
>> uClibc-ng
> 
> What makes you think libintl disappears from uClibc-ng? uClibc-ng has
> recently *added* libintl support.

 Crap, I was confusing with RPC, due to your statement "just a stub implementation".

> 
> Basically, today we have the following situation:
> 
>  * glibc comes with its own libintl implementation, which is
>    full-featured
> 
>  * uClibc-ng until recently did not have any libintl implementation, so
>    we are building the libintl from gettext to get a libintl
>    implementation. uClibc-ng has recently added a stub libintl
>    implementation, which does not support translation, i.e it's really
>    just a stub.
> 
>  * musl has a libintl implementation. It is not a stub, and seems to
>    support translation (i.e it seems to read .mo files for
>    translations, etc.).

 Ah yes, I didn't see a mention of locales anywhere in the musl related code,
but it's just in the default of BR2_NEEDS_GETTEXT that we can see that it's only
relevant for uClibc.

 Would the libintl from uClibc make it easier to do static linking, i.e. is it
in libc or in a separate libintl library?

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
