From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 24 Jul 2015 00:30:44 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-22
In-Reply-To: <20150723221133.51e59215@free-electrons.com>
References: <20150723063018.EA19A101D01@stock.ovh.net>
 <55B12984.2090104@openwide.fr>
 <20150723221133.51e59215@free-electrons.com>
Message-ID: <CAMo8BfJTvgvTPviYqiAhgMk+eEerLYU4m3cgGwC5XWmKp_gF7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Jul 23, 2015 at 11:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Romain Naour,
>
> On Thu, 23 Jul 2015 19:51:00 +0200, Romain Naour wrote:
>> Hi Alexey,
>>
>> Le 23/07/2015 08:30, Thomas Petazzoni a ?crit :
>> > Detail of failures
>> > ===================
>>
>> >       xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/56de85f9bc0ba44248003212b5dc4cb8dcde19c5/
>>
>> I noticed a new build failure in autobuilders due to your gcc package patch:
>> http://patchwork.ozlabs.org/patch/453849/
>
> Did you notice xtensa or other platforms as well? Before applying
> Alexey's patch I tested an ARM toolchain build with -O2 and -Os and it
> built fine.
>
> Though it's indeed a problem if it causes a regression on other
> architectures. Alexey, Max, can you have a look at least for the Xtensa
> case? If there is no feedback soon, I'll revert Alexey's patch in the
> mean time.

I looked at that patch a while ago and reported that it looks good but
doesn't work for xtensa, got no reply though:
http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/116099

Most of libgcc issues are just missing .literal_position in assembly
functions, I'll post a patch that fixes them. But there's bigger issue
with literals emitted for .init and .fini sections, for which I don't have
a fix yet.

-- 
Thanks.
-- Max
