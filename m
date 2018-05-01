From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 1 May 2018 22:19:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: remove libnsl linking
 with Glibc.
In-Reply-To: <20180501221254.7f29363b@windsurf.home>
References: <20180501200508.13974-1-romain.naour@gmail.com>
 <20180501221254.7f29363b@windsurf.home>
Message-ID: <8328c7c8-4c79-20d7-6e7c-425fe3d9fcf7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/05/2018 ? 22:12, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Tue,  1 May 2018 22:05:07 +0200, Romain Naour wrote:
>> libnsl has been deprecated from Glibc and no other libc provide it.
>> Also there is no libnsl package in Buildroot yet, so remove -lnsl for
>> all toolchains.
>>
>> libnsl is now a library that can be packaged later if needed. [1]
>>
>> Note: Fedora 28 has switched to the new libnsl library that bring
>> IPV6 support. [2]
>>
>> [1] https://github.com/thkukuk/libnsl.git
>> [2] https://fedoraproject.org/wiki/Changes/NISIPv6
> 
> This commit log doesn't really explain the motivation for the change.
> What is the ultimate goal here ?

The motivation is to remove libnsl provided by Glibc. Since the new libnsl is
not packaged in Buildroot. Remove -lnsl from the exim Makefile.

Best regards,
Romain

> 
> Thomas
> 
