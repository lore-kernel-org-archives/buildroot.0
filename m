From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 7 Mar 2017 09:40:27 +0100
Subject: [Buildroot] Download tag as archive from gitlab
In-Reply-To: <cccc2430-04c1-c447-a2a3-027cc0fba60a@mind.be>
References: <CA+TH9Vmhs+bLmoo5UvD5VWAPahsDnseJ-eeEcBQJrwDHDKUQrQ@mail.gmail.com>
 <20170307071107.GA3676@free.fr> <cccc2430-04c1-c447-a2a3-027cc0fba60a@mind.be>
Message-ID: <CA+TH9VmtxVJZGom-0aEfP1gf47d-vSv8tQvzEf32RAvN3bVmeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout, Yann,

2017-03-07 9:36 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 07-03-17 08:11, Yann E. MORIN wrote:
>> Angelo, All,
>>
>> On 2017-03-07 00:28 +0100, Angelo Compagnucci spake thusly:
>>> I'm hitting some bumps trying to download a tag from gitlab as an
>>> archive, the url format is like this:
>>>
>>> https://gitlab.com/gitlab-org/gitlab-ce/repository/archive.tar.bz2?ref=v6.9.2
>>>
>>> I can succesfully download the file, but then it's named
>>> "archive.tar.bz2?ref=v6.9.2" but it cannot be extracted cause it lacks
>>> an extensions and buildroot cannot choose the right helper to
>>> decompress it.
>>>
>>> How such an url can be downloaded in buildroot?
>>
>> The only solution is to download it with a git clone:
>
>  The only solution you can think of :-)
>
>  You can use the following hack:
>
> FOO_VERSION = v6.9.2
> FOO_SITE = https://.../archive.tar.bz2?ref=$(FOO_VERSION)&filename=
> FOO_SOURCE = foo-$(FOO_VERSION).tar.bz2
>
>  This will lead to a wget of
> https://.../archive.tar.bz2?ref=v6.9.2&filename=/foo-v6.9.2.tar.bz2
> to the file foo-v6.9.2.tar.bz2.
>
>  It works because in a GET request, any unknown variables are typically ignored.
> Last time I tried gitlab did ignore them.
>
>  Of course you can use anything you like for FOO_SOURCE, but it's convenient to
> use the canonical name.

I was arrived at the same solution just minutes ago! I think just
adding a gitlab helper like the github one with the hack included!

Thanks!

Sincerely, Angelo

>
>  Regards,
>  Arnout
>
>
>>
>>     FOO_VERSION = TAG_OR_SHA1
>>     FOO_SITE = https://gitlab.com/gitlab-org/gitlab-ce
>>     FOO_SITE_METHOD = git
>>
>> Regards,
>> Yann E. MORIN.
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
