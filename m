From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 16 Oct 2014 11:37:31 -0400
Subject: [Buildroot] [PATCH v3] cppunit: Added package
In-Reply-To: <543F99DF.1030103@mind.be>
References: <1413404565-16362-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<543F8710.4010708@mind.be>	<20141016110834.0410d5ce@free-electrons.com>	<543F9315.3010104@mind.be>
 <20141016115340.26569604@free-electrons.com> <543F99DF.1030103@mind.be>
Message-ID: <543FE63B.8060802@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for your review.
i will send a new patch with all your suggestions.

Regards,
Sebastien.

On 10/16/2014 06:11 AM, Arnout Vandecappelle wrote:
> On 16/10/14 11:53, Thomas Petazzoni wrote:
>> Dear Arnout Vandecappelle,
>>
>> On Thu, 16 Oct 2014 11:42:45 +0200, Arnout Vandecappelle wrote:
>>
>>>> No: if it's really related to shared libraries, then it should be a
>>>> depends on !BR2_PREFER_STATIC_LIB.
>>>  Yeah, you're probably right. It does build with PREFER_STATIC on other
>>> architectures, but that's just because there still is a dlopen in staging so it
>>> still sets CPPUNIT_HAVE_LIBDL and then it builds "correctly". But we most likely
>>> have many many packages that seem to build correctly with STATIC but actually
>>> still use shared libraries or dlopen. We probably should remove ld.so and
>>> libdl.* from staging when building static.
>> Well, for packages that do build on noMMU platforms, we do catch such
>> issues thanks to the bfin-uclinux toolchain configuration that is used
>> on the autobuilders. But for those other packages that don't build on
>> noMMU, we indeed don't check properly if we're able to do a pure static
>> build.
>  No, what I mean is: on platforms that do support shared libraries and packages
> that support static-only, they will still detect that dlopen() is supported and
> so they will still build support for dynamic libraries.
>
>  But it's actually not a big deal, since they'll link with libdl.a so even at
> runtime everything will work. I guess.
>
>
>> Alexey has sent a patch to remove HAVE_SHARED from the uClibc
>> configuration when BR2_PREFER_STATIC_LIB is enabled. Maybe this will
>> get rid of ld.so, libdl and so on? I haven't tested yet.
>  I don't know either.
>
>  Regards,
>  Arnout
>
>
