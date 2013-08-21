From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 18:41:06 +0200
Subject: [Buildroot] [PATCH v2] <pkg>-rsync: support user custom cmds
In-Reply-To: <CAEvN+1hRHX-RmBU67sRM7PS43N+XfoUQZOOQ1JYJsVp=DAe2rQ@mail.gmail.com>
References: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
 <1375007963-15935-1-git-send-email-tjlee@ambarella.com>
 <20130728150334.6a8a862c@skate>
 <CAAXf6LXvJjA_Wxm=OMCBKYZKudveUj=J-fpU7SeXgCxoH3MQhA@mail.gmail.com>
 <CAAXf6LWwD6fkDpANcYnKT+ShQoBPJKpjJm-1K70DYjs+5eWqEA@mail.gmail.com>
 <CAEvN+1iY-77EV8Ao9zNhm94H0JKbOQNv10iQRqMLMnot28PJAQ@mail.gmail.com>
 <CAAXf6LVDWo5RhPaH9DHGrmfwBuDGhs9G8W7p=XHKvsGeEM4OcQ@mail.gmail.com>
 <CAAXf6LVYEkcdUvf6+Whht0gX_XSQe1nNp_FPBg3g06diR9fPCQ@mail.gmail.com>
 <CAEvN+1hA4T0B_azTQMhpX=o-k2yac4fy7a7r4u=WyROYZrQU8w@mail.gmail.com>
 <52145998.5090300@mind.be>
 <CAEvN+1hRHX-RmBU67sRM7PS43N+XfoUQZOOQ1JYJsVp=DAe2rQ@mail.gmail.com>
Message-ID: <5214EDA2.5050904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/21/13 09:20, Tzu-Jung Lee wrote:
> On Wed, Aug 21, 2013 at 2:09 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 08/20/13 20:14, Tzu-Jung Lee wrote:
>>>
[snip]
>>> If we're considering efficiency for some cases, especially those have
>>> giant VCS
>>> database such as linux kernel, I think the combination of the two
>>> patches proposed
>>> already simple enough. They don't really add that much of complexity, I
>>> think.
>>>
>>>    1. Support customized RSYNC (this patch)
>>
>>
>>   Like Thomas, I really don't see the point of being able to choose cp
>> instead of rsync.
>>
>>>    2. Allow each package add their post-rsync hook if they need.
>>
>>   Adding the VCS stuff in a post-rsync-hook is really hackish.
>>
>>   Instead, I think the rsync command should use $($(PKG)_RSYNC_OPTS), which
>> allows the user to specify additional --include options in the override.mk
>> file. The documentation of the override.mk file should also be updated to
>> explain this possibility.
>
> $($(PKG)_RSYNC_OPTS) alone only gives the choice to sync / cp them or not.
>
> In some cases we actually prefer to simply link the VCS stuff instead
> of copying it
> to the build directory, especially if the VCS of the package is very huge.
>
> Not only the time taken by rsyncing them from a possibly networked mounted
> file system, but also the additional storage space taken by the build.
> If we are building multiple rootfs images that are built with Linux
> kernel from local
> source. It takes a few GB additional space in the build directories.
>
>
> So $($(PKG)_RSYNC_OPTS) can be replace the 1) custom RSYNC cmd patch.
> But we still need rsync-post-hook or other less hacky alternatives.

  Yes, that sounds reasonable.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
