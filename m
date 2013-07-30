From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Jul 2013 12:16:44 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fix for top-level parallel make part
	1
In-Reply-To: <20130730120157.0d32a58b@skate>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <20130718113809.663c6b58@skate>
 <CAHkwnC8imHc+yWdkUeR6VdehBhpuux_xmKProHu7uFmmR50N8g@mail.gmail.com>
 <20130727131828.0442e227@skate>
 <CAHkwnC-yTeGXQnh64-Ra_TJg4ysYqAPNsNaWhA=_sgiUm5R5bw@mail.gmail.com>
 <20130730120157.0d32a58b@skate>
Message-ID: <CAHkwnC8SV6L=4a0ain-VysEw3Z8Jg_XLLUJWH1xo6T=FVeYO6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 30, 2013 at 12:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Tue, 30 Jul 2013 11:34:08 +0200, Fabio Porcedda wrote:
>
>> > As per OpenEmbedded/Bitbake, I was told a few years ago that they were
>> > not doing per-package sysroot, even though they are doing top-level
>> > parallel builds, and that this was sometimes causing some spurious
>> > failures or not completely reproducible builds. However, I haven't
>> > verified this myself, and this statement was made some years ago, so it
>> > may or may not longer be true.
>>
>> Unfortunately right now i've not enough time to work on the
>> per-package sysroot feature, maybe in the feature, i don't know.
>>
>> So are you going to accept this patch set even without per-package
>> sysroot feature?
>> IMHO top-level parallel make it's still a useful feature even without
>> per-package sysroot.
>> The per-package sysroot feature can be still added later.
>
> As we discussed in this thread, the problem is that the top-level
> parallel make feature is broken if you don't have per-package sysroot:
> builds become non-reproducible.

Just to understand better, this is true only for packages with
unexpressed dependencies, right?
So if a build has only packages with full expressed dependencies the
builds are reproducible?

Best regards and thanks
-- 
Fabio Porcedda
