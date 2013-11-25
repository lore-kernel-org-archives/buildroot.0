From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Nov 2013 16:39:27 +0100
Subject: [Buildroot] [PATCH] lvm2: replace
 !BR2_PACKAGE_LVM2_DMSETUP_ONLY by BR2_PACKAGE_LVM2_FULL_SUITE
In-Reply-To: <52936E30.1000208@mind.be>
References: <20131123183721.071bcfa1@skate>
 <1385250624-15984-1-git-send-email-arnout@mind.be>
 <CAAXf6LXHZw6YRg1P+2=B1wca0CWHFhxocnYoQ4W7JmOb_v=Twg@mail.gmail.com>
 <52932E3A.2080903@mind.be>
 <CAAXf6LU5OkxP8VyPZ4XK0Fp6KAAn6N+8OhiQnXnv4f-=4Lk3AA@mail.gmail.com>
 <52936E30.1000208@mind.be>
Message-ID: <52936F2F.8040108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/13 16:35, Arnout Vandecappelle wrote:
> On 25/11/13 16:10, Thomas De Schampheleire wrote:
>> On Mon, Nov 25, 2013 at 12:02 PM, Arnout Vandecappelle <arnout@mind.be>
>> wrote:
[snip]
>>
>> How 'large' is this application library? In this particular
>> configuration it is 810K (liblvm2app.so). Is it acceptable to include
>> it always in the 'full suite' (and thus remove the option
>> BR2_PACKAGE_LVM2_APP_LIBRARY)?
>
>   To help answer that question, on my x86_64 glibc build:
>
> 3.0M    /tmp/lvm2-app-library
> 2.1M    /tmp/lvm2-full-suite
> 472K    /tmp/lvm2-minimal

  Sorry, I forgot to strip and remove the redundant files. It should be:

2.5M    /tmp/lvm2-app-library
1.6M    /tmp/lvm2-full-suite
396K    /tmp/lvm2-minimal


  Conclusion remains the same, though.

>
>
>   So the app library adds another 40% to the package size. I guess that's
> significant enough not to remove the existing option. Especially because
> the only reason is that we can't find a better name for it :-)
>
>   My original name was "install all binaries", but I found that less
> descriptive than "full suite". Maybe "install all LVM2 programs"?
>
>   I could also copy the full list (which is in the .mk file) to the help
> text.
>
>   Regards,
>   Arnout
>
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
