From: Koen Martens <gmc@sonologic.nl>
Date: Fri, 07 Jul 2017 08:58:08 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
In-Reply-To: <20170706211612.5c4bf11c@windsurf.lan>
References: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
 <20170706211612.5c4bf11c@windsurf.lan>
Message-ID: <A9C99900-5E84-4FF4-9980-DBB39ED471AA@sonologic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 6 July 2017 21:16:12 CEST, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Hello,
>
>On Thu, 6 Jul 2017 17:40:01 +0200, Koen Martens wrote:





>> diff --git a/package/capnproto/0001-execinfo.patch
>b/package/capnproto/0001-execinfo.patch
>> new file mode 100644
>> index 0000000..85ef716
>> --- /dev/null
>> +++ b/package/capnproto/0001-execinfo.patch
>> @@ -0,0 +1,85 @@
>> +Capnproto assumes that if __GLIBC__ is defined then
>> +execinfo.h is available. uClibc does not implement
>> +execinfo.h, but does define __GLIBC__ in features.h
>> +(documented as an acceptable lie).
>> +
>> +We add an explicit check for existence of execinfo.h
>> +to configure and use HAVE_EXECINFO_H in the code
>> +that includes execinfo.h
>> +
>> +A more permanent patch has been submitted upstream
>> +as a pull-request.
>> +
>> +https://github.com/capnproto/capnproto/pull/511
>> +
>> +Signed-off-by: Koen Martens <gmc@sonologic.nl>
>
>Since upstream uses Git, we prefer to have a Git-formatted patch, i.e
>generated with "git format-patch -N". It should also have a proper
>commit title, i.e a single line at the beginning that summarizes the
>commit, separated from the rest of the commit log by one empty line.

Sure, except the published tarball is from a subdirectory of the upstream git repo. So creating a git patch with format-patch results in a patch that needs 'patch -p2' to apply in buildroot. I understand this is impossible. What do you prefer i do? Manually modify the patch to remove the subdir that should be stripped?






>> +CAPNPROTO_DEPENDENCIES = host-capnproto
>
>Could you give some details as to why the host capnproto is necessary
>to build the target capnproto ?

Capnproto provides a compiler to compile capnproto message definitions to c++ code. The library uses capnproto messages itself, and thus needs the capnproto compiler to compile. This obviously must be the host capnproto compiler, because the target compiler will not run on the compiling host.

Is that sufficient detail, or do you want this in the package files somewhere? If so, where?

- Koen

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
