From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 9 Sep 2020 16:27:14 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/boost: bump to version 1.74.0
In-Reply-To: <20200909155600.6cf8450e@windsurf.hq.k.grp>
References: <20200909093240.2178664-1-fido_max@inbox.ru>
 <20200909155600.6cf8450e@windsurf.hq.k.grp>
Message-ID: <199e6a77-7ebc-eb1c-4482-206f1429c5d0@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/09/2020 15:56, Thomas Petazzoni wrote:
> Hello Maxim,
> 
> On Wed,  9 Sep 2020 12:32:40 +0300
> Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:
> 
>> gcc 10 C++20 breaks boost library due to allocator changes.
>> https://github.com/boostorg/bimap/issues/23
>>
>> We need boost 1.74.0 to fix build with gcc 10
>>
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> 
> We don't have any failures of boost 1.73.0 with gcc 10 in our
> autobuilders. Could you give more details about a specific
> configuration that fails to build?

boost::bimap is a header-only library, it cannot fail to build, only its
reverse dependencies may fail. the release notes? also mention other
header-only boost libraries "and more" are affected by the non-standard
std::allocator usage.

C++20 isn't the default in GCC 10 and it's highly probable that there
are no package in buildroot that requires both boost and C++20.
Especially since C++20 was finally approved this very Saturday.

This is more about future proofing than fixing existing bugs.

[0] https://www.boost.org/users/history/version_1_74_0.html
