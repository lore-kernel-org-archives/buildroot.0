From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Mar 2016 20:23:16 +0100
Subject: [Buildroot] Bug during Kodi compile with host gcc <4.7,
 question regarding autobuilders
References: <934hrcx7vo.ln2@ID-313208.user.individual.net>
 <56E5E786.1090906@mind.be>
Message-ID: <4mfjrcxqge.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 13 Mar 2016 23:19:50 +0100 schrieb Arnout Vandecappelle:

> On 03/13/16 22:53, Bernd Kuhls wrote:
>> Hi,
>>
>> before sending a patch which fixes a problem with host gcc < 4.7 I
>> would like to ask whether this patch is needed at all. Are there
>> autobuilders where the host version of gcc is < 4.7?
> 
>   Well, RHEL6 has gcc 4.4, and ideally we'd like to support RHEL5 as
>   well (many
> companies are still based on it).
> 
>   But we have a simple solution now: kodi depends on
>   BR2_HOST_GCC_AT_LEAST_4_7.

Hi,

with my proposed patch we can lower it to BR2_HOST_GCC_AT_LEAST_4_6 ;)

With gcc 4.4 (testing with Ubuntu 10.04.4) adding -std=c++0xwill not be 
enough:

XBTFWriter.cpp: In constructor ?CXBTFWriter::CXBTFWriter(const 
std::string&)?:
XBTFWriter.cpp:42: error: ?nullptr? was not declared in this scope

Looking around for approaches to solve the problem I found these two 
commits:

https://hg.mozilla.org/integration/mozilla-inbound/rev/ae45a2c9d678
https://github.com/grpc/grpc/
commit/3ff350cf96676f2c32c6913aceeabf84a15f3715

Is either one good enough so I can try to solve the problem? I am asking 
in advance because I am not a c++ programmer.

Regards, Bernd
