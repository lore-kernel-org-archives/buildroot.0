From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Apr 2021 09:33:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/genext2fs: bump to version 1.5.0
In-Reply-To: <b37de2fb-72ef-f5c0-b714-8fae2b4956e0@yandex.ru>
References: <20210414214439.1381969-1-fontaine.fabrice@gmail.com>
 <016dd397-3ae8-d6af-c3f8-8a88d72bedb0@mind.be>
 <b37de2fb-72ef-f5c0-b714-8fae2b4956e0@yandex.ru>
Message-ID: <70d40419-5b26-453a-e806-ab47d9f22e1b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/04/2021 00:32, stsp wrote:
> 15.04.2021 22:20, Arnout Vandecappelle ?????:
>> On 14/04/2021 23:44, Fabrice Fontaine wrote:
>>> - Retrieve latest version from github
>>> - Drop patch (already in version)
>>>
>>> Fixes:
>>> ? - https://bugs.buildroot.org/show_bug.cgi?id=13741
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>
>> ? Applied to master, thanks.
>>
>> ? I guess for stable, the patch [1] should be backported rather than bumping. But
>> is it worth spending effort on that for a borderline package like genext2fs?
> I tried really hard (before
> reporting the above bug)
> to find the equivalent
> functionality in mkfs.ext[24],
> and I think its simply not there.
> I think only genext2fs allows
> to set the perms for the root
> node, so I am not sure why it
> is borderline.

 Because on the target, you can generally simply do an mkfs directly of the
partition, then mount it, then set permissions and/or populate it as needed.
Even the mkfs from busybox is usually sufficient on target.

 Of course, Buildroot lives for borderline cases :-). But specifically for the
stable branches, I don't think it's very cost-effective to spend time on making
them work, unless there's a user who does the effort (because they actually need
it).

 Regards,
 Arnout

> Are there any alternatives?
> Buildroot currently creates
> only the rootfs image, and
> for that the default root node
> perms are fine. But once you
> want to create the user partition,
> I think genext2fs is the only
> solution.
> Please let me know if this is
> wrong.
