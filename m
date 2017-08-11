From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Aug 2017 12:57:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: bump to version 5.0.1.1
In-Reply-To: <7dc157e1-bde7-5143-be61-aaee3c309bcb@mind.be>
References: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
 <1502439245-18039-2-git-send-email-angelo.compagnucci@gmail.com>
 <7dc157e1-bde7-5143-be61-aaee3c309bcb@mind.be>
Message-ID: <CA+TH9VmC_qbAKYfWZmDm_=TZjVsSFg0vgNBY7w9OeKogfuXfiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

2017-08-11 12:00 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 11-08-17 10:14, Angelo Compagnucci wrote:
>> This patch bumps to mono 5.0.1.1 and updates the unit tests patch
>> accordingly.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>>  .../0006-Remove-unit-tests-from-mono-compilation.patch     | 14 +++++++-------
>
>  What is the upstream status of all the patches? Most of the other patches look
> like they could be applicable for upstream, can you send them?

All upstremeable patches are already be sent. Mono has a really long
release cycle and the patches, also if applied, are not released in
stable branches immediately.

>  Also, patch 4 says:
>
> Patch is upstream:
>
>    https://github.com/mono/mono/commit/40c171799b671718969ee28a02f92884d7fd181e
>
> so why is this one not removed? Could you mention that explicitly in the commit log?

Cause the patch is present from the tag mono-5.4.0.135 (future
release) the stable release is now at 5.0.1.1 .
I usually do care to remove patches upstreamed.

>  It would also be nice to rewrite patch 6 and 8 so they are upstreamable, but I
> can imagine that that's more complicated.

Patch 8 is not upstremeable cause the way buildroot handles paths.
Buildroot sets $(mono_libdir) to the full host path, instead mono here
expects something related to the / of the target.

For patch 6 I've not tried cause it's a bit of a corner case: running
mono unit-tests during compilation is not advisable cause it takes
time but also cause they expects a certain environment that buildroot
screws up. To make the unit-tests running in buildroot mono should be
patched, but I originally though it was not necessary.

>
>  Regards,
>  Arnout
>
>
> [snip]
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
