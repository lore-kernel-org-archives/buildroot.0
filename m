From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 4 Jan 2016 23:07:22 +0100
Subject: [Buildroot] [PATCH] fakeroot: fix build when libcap-dev is
 installed
In-Reply-To: <568AE5E5.3020307@mind.be>
References: <1451908883-4942-1-git-send-email-luca@lucaceresoli.net>
 <568AB024.40104@mind.be> <568AE5E5.3020307@mind.be>
Message-ID: <568AED1A.2060509@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle wrote:
> On 04-01-16 18:47, Arnout Vandecappelle wrote:
>>   Hi Luca,
>>
>> On 04-01-16 13:01, Luca Ceresoli wrote:
>>> On an Ubuntu host, and probably several other build hosts,
>>> host-fakeroot fails building when libcap-dev is installed.
>>>
>>> Error message:
>>>
>>>    libfakeroot.c:1646:9: error: conflicting types for 'setxattr'
>>>     ssize_t setxattr(const char *path, const char *name, void *value, size_t size, int flags)
>>>             ^
>>>    In file included from /usr/include/sys/capability.h:30:0,
>>>                     from libfakeroot.c:131:
>>>    /usr/include/x86_64-linux-gnu/sys/xattr.h:39:12: note: previous declaration of 'setxattr' was here
>>>     extern int setxattr (const char *__path, const char *__name,
>>>                ^
>>>
>>> To reproduce the bug:
>>>
>>>    make defconfig && make host-fakeroot
>>>
>>> This is a fakeroot bug fixed in Debian since 1.20.1-1 [0]. Apply the
>>> patch [1] to Buildroot as well.
>>
>>   Are we sure this will not break again on other distros or older Debian/Ubuntu?

Not sure, but xattr.h should not have changed recently. However...

>
>   I prefer Ricardo's alternative.

...I do prefer Ricardo's patch as well. Thanks, Ricardo. And since it
has already been committed, this discussion is now pointless.

I marked this patch as Superseded in patchwork.

-- 
Luca
