From: stsp <stsp2@yandex.ru>
Date: Fri, 16 Apr 2021 01:32:40 +0300
Subject: [Buildroot] [PATCH 1/1] package/genext2fs: bump to version 1.5.0
In-Reply-To: <016dd397-3ae8-d6af-c3f8-8a88d72bedb0@mind.be>
References: <20210414214439.1381969-1-fontaine.fabrice@gmail.com>
 <016dd397-3ae8-d6af-c3f8-8a88d72bedb0@mind.be>
Message-ID: <b37de2fb-72ef-f5c0-b714-8fae2b4956e0@yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

15.04.2021 22:20, Arnout Vandecappelle ?????:
> On 14/04/2021 23:44, Fabrice Fontaine wrote:
>> - Retrieve latest version from github
>> - Drop patch (already in version)
>>
>> Fixes:
>>   - https://bugs.buildroot.org/show_bug.cgi?id=13741
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
>   Applied to master, thanks.
>
>   I guess for stable, the patch [1] should be backported rather than bumping. But
> is it worth spending effort on that for a borderline package like genext2fs?
I tried really hard (before
reporting the above bug)
to find the equivalent
functionality in mkfs.ext[24],
and I think its simply not there.
I think only genext2fs allows
to set the perms for the root
node, so I am not sure why it
is borderline.
Are there any alternatives?
Buildroot currently creates
only the rootfs image, and
for that the default root node
perms are fine. But once you
want to create the user partition,
I think genext2fs is the only
solution.
Please let me know if this is
wrong.
