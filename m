From: Daniel Mack <zonque@gmail.com>
Date: Wed, 30 Nov 2011 17:31:40 +0100
Subject: [Buildroot] [PATCH 1/2] iw: fix build with new libnl-3
In-Reply-To: <CAGm1_kvpf=bZxzPqgXQ65R_vo6XVp-3KFkjCt_JC8WY32OPaiw@mail.gmail.com>
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
 <1322665560-29888-1-git-send-email-zonque@gmail.com>
 <CAGm1_kvpf=bZxzPqgXQ65R_vo6XVp-3KFkjCt_JC8WY32OPaiw@mail.gmail.com>
Message-ID: <4ED65A6C.2020003@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On 11/30/2011 04:54 PM, Yegor Yefremov wrote:
> On Wed, Nov 30, 2011 at 4:05 PM, Daniel Mack <zonque@gmail.com> wrote:
>> The CFLAGS have to be augmented for the include dir and the patch
>> needs to be tweaked to make the binary link to libnl-3 instead of
>> libnl-gen.
>>
>> Signed-off-by: Daniel Mack <zonque@gmail.com>
>> ---
>>  package/iw/iw-libnl-30-support.patch |    2 +-
>>  package/iw/iw.mk                     |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/iw/iw-libnl-30-support.patch b/package/iw/iw-libnl-30-support.patch
> 
> this file has gone in next. Please rebase your patches on the next

I can do this. I wasn't even aware of this branch, and part of the
reason is that it doesn't show up on the cgit web interface
(http://git.buildroot.net/buildroot) when there's no trailing slash in
the URI, which is unfortunately the location the website
(http://buildroot.uclibc.org/git.html) points visitors to. You can click
on "refs" and back on "summary" which will add the "/" suffix, and then
cgit will show the existance of the "next" branch. Very odd.

> branch and try to get iw from git with this commit
> http://git.sipsolutions.net/?p=iw.git;a=commit;h=a82abc2cac9dea7def53070565201145c76c8c6c.

Not sure whether I follow you here. Do you suggest writing package
definitions for sources that are not released yet officially? If that is
the case, what is the reason?

Also, I fail to see how the commit you pointed me to is related to the
changed location of libnl-3. Is this not something that should be
addressed independently?

All my other libnl-related patches still seem to apply fine on the -next
branch, though.


Daniel
