From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 30 Nov 2011 22:31:47 +0100
Subject: [Buildroot] [PATCH 1/2] iw: fix build with new libnl-3
In-Reply-To: <4ED65A6C.2020003@gmail.com>
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
 <1322665560-29888-1-git-send-email-zonque@gmail.com>
 <CAGm1_kvpf=bZxzPqgXQ65R_vo6XVp-3KFkjCt_JC8WY32OPaiw@mail.gmail.com>
 <4ED65A6C.2020003@gmail.com>
Message-ID: <CAGm1_kshT=7x4wjx+UX2jyU8M0kmRt4xdhY+0YctioFzg_1FRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

>>> The CFLAGS have to be augmented for the include dir and the patch
>>> needs to be tweaked to make the binary link to libnl-3 instead of
>>> libnl-gen.
>>>
>>> Signed-off-by: Daniel Mack <zonque@gmail.com>
>>> ---
>>> ?package/iw/iw-libnl-30-support.patch | ? ?2 +-
>>> ?package/iw/iw.mk ? ? ? ? ? ? ? ? ? ? | ? ?2 +-
>>> ?2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/iw/iw-libnl-30-support.patch b/package/iw/iw-libnl-30-support.patch
>>
>> this file has gone in next. Please rebase your patches on the next
>
> I can do this. I wasn't even aware of this branch, and part of the
> reason is that it doesn't show up on the cgit web interface
> (http://git.buildroot.net/buildroot) when there's no trailing slash in
> the URI, which is unfortunately the location the website
> (http://buildroot.uclibc.org/git.html) points visitors to. You can click
> on "refs" and back on "summary" which will add the "/" suffix, and then
> cgit will show the existance of the "next" branch. Very odd.
>
>> branch and try to get iw from git with this commit
>> http://git.sipsolutions.net/?p=iw.git;a=commit;h=a82abc2cac9dea7def53070565201145c76c8c6c.
>
> Not sure whether I follow you here. Do you suggest writing package
> definitions for sources that are not released yet officially? If that is
> the case, what is the reason?

I see here 3 possibilities:

1. replace official release with git one
2. wait for iw 3.3
3. apply related patches (from iw repo) only

the first way is simpler and quicker to implement

> Also, I fail to see how the commit you pointed me to is related to the
> changed location of libnl-3. Is this not something that should be
> addressed independently?

I just pointed to the latest commit. You can choose the one with related changes

> All my other libnl-related patches still seem to apply fine on the -next
> branch, though.

ACK

Yegor
