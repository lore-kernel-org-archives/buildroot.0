From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 31 Oct 2016 12:42:45 -0400
Subject: [Buildroot] [PATCH v3 0/9] Update LTTng packages to 2.8.x and
 Babeltrace to 1.4.0
In-Reply-To: <20161031103938.GH3389@free.fr>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031103938.GH3389@free.fr>
Message-ID: <CAB4xu_2LtuQ0Ox+GzqpxTXP0ziB3sxeKjzSp6sGDeM4AzF5xsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 31, 2016 at 6:39 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Philippe, All,
>
> On 2016-10-31 03:46 -0400, Philippe Proulx spake thusly:
>> See individual patches for changes.
>>
>> Philippe Proulx (9):
>>   lttng-libust: bump to version 2.8.1
>>   lttng-libust: enable Python agent when Python is available
>>   lttng-tools: bump to version 2.8.2
>>   lttng-tools: remove dependency on host-lttng-babeltrace
>>   lttng-modules: bump to version 2.8.3
>>   lttng-babeltrace: bump to version 1.4.0
>>   lttng-babeltrace: add host Babeltrace as host utility
>>   lttng-babeltrace: add debug info support
>>   lttng-babeltrace: rename to babeltrace
>
> Durng the review, I wanted to check something so I tried to apply th
> series on top of master. Some of the patches do not apply, but I can't
> see why:
>
>     Description: [v3,3/9] lttng-tools: bump to version 2.8.2
>     Applying: lttng-tools: bump to version 2.8.2
>     .git/rebase-apply/patch:117: space before tab in indent.
>             errno = 0;
>     .git/rebase-apply/patch:118: space before tab in indent.
>             id = strtol(argv[1], &name, 10);
>     .git/rebase-apply/patch:121: space before tab in indent.
>                     ret = del_output(UINT32_MAX, name);
>     .git/rebase-apply/patch:122: space before tab in indent.
>             } else if (errno == 0 && *name == '\0') {
>     .git/rebase-apply/patch:123: space before tab in indent.
>                     ret = del_output(id, NULL);
>     error: patch failed: package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch:1
>     error: package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch: patch does not apply
>     error: patch failed: package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch:1
>     error: package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch: patch does not apply
>     Patch failed at 0001 lttng-tools: bump to version 2.8.2
>     The copy of the patch that failed is found in: .git/rebase-apply/patch
>     When you have resolved this problem, run "git am --continue".
>     If you prefer to skip this patch, run "git am --skip" instead.
>     To restore the original branch and stop patching, run "git am --abort".
>     'git am' failed with exit status 128
>
> So, those patches do not apply:
>     lttng-tools: bump to version 2.8.2
>     lttng-babeltrace: bump to version 1.4.0
>
> The failures (in both cases) occur when trying to delete existing
> patches, but not for all removals:
>     package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
>     package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
>     package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
>
> I've had a look at the patches, but they look correct. :-/

I suspect my text editor removed some trailing whitespaces, but I'm
not sure. I can try to disable trailing whitespace removal, and submit a
v4, or the committer can remove those 3 files manually, as you wish.

Phil

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
