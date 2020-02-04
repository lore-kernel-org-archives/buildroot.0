From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Feb 2020 09:25:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.25,
 add xtensa support
In-Reply-To: <20200201102425.1556253b@windsurf>
References: <20200201084758.285234-1-bernd.kuhls@t-online.de>
 <20200201102425.1556253b@windsurf>
Message-ID: <ba2c8b6f-1ccb-b077-a789-cdbe2b987915@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/02/2020 10:24, Thomas Petazzoni wrote:
> On Sat,  1 Feb 2020 09:47:57 +0100
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
>> nspr 4.25 added support for Xtensa architecture:
>> https://groups.google.com/forum/#!topic/mozilla.dev.tech.nspr/lK7toqtJ96E
>>
>> Removed BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT because it was only needed for
>> xtensa.
>>
>> Added sha1 hash provided by upstream.
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> I don't feel very strongly about it, but I'm wondering if it doesn't
> make sense to keep BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT. There is some
> architecture-specific code in libnpsr, so every time we add a new CPU
> architecture, we would have to poentially re-add this hidden option.

 For what it's worth, I agree with doing that. We don't want to end up in the
libffi situation...

 Regards,
 Arnout

> 
> More specifically, I have been working on using Buildroot for a new CPU
> architecture (not yet upstream, but will be submitted in the future),
> and it was quite nice to have this BR2_PACKAGE_LIBNPSR_ARCH_SUPPORT to
> disable libnpsr on this CPU architecture for the moment.
> 
> But again, I don't feel very strongly, it can very well be re-added
> later if need be.
> 
> Best regards,
> 
> Thomas
> 
