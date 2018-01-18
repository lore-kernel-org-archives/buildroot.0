From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 18 Jan 2018 12:09:10 -0600
Subject: [Buildroot] [PATCH] xen: bump to version 4.9.1
In-Reply-To: <CAKmqyKPg=e5TPN20nCe4kkqv1nt=CnRcR2qTBq_0Hm5FasX26w@mail.gmail.com>
References: <20180114224711.25133-1-peter@korsgaard.com>
 <CANQCQpayJkVAxWQS_42y+o3b-TJ5P5EVFzoz5cOcwmcsLTZJYA@mail.gmail.com>
 <87po69yf9e.fsf@dell.be.48ers.dk>
 <CANQCQpaWOWy86JmBYgaooiOmwhh_+nHVU=roOV6-jfOmu8qhKA@mail.gmail.com>
 <87bmhrdspx.fsf@dell.be.48ers.dk>
 <CAKmqyKPg=e5TPN20nCe4kkqv1nt=CnRcR2qTBq_0Hm5FasX26w@mail.gmail.com>
Message-ID: <CANQCQpZgh5MVL98xyPtv6wArQ0J=BwybXFj0qOBKBf_8CpLH2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alistair,

On Thu, Jan 18, 2018 at 12:04 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Jan 18, 2018 at 8:42 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>>
>> Hi,
>>
>>  >> Hmm, it looks like the embedded qemu copy picks up sdl2, which it
>>  >> probably shouldn't (or we should atleast handle the dependencies
>>  >> correctly).
>>  >>
>>
>>  > Should we by default force SDL to be turned on for xen tools,
>>  > explicitly disable or make it optional?  I can see some additional
>>  > patches to make their --disable-sdl work vs fixing the include paths
>>  > to formally --enable-sdl.
>>
>> As long as it is optional, it shouldn't be forced on - So we should
>> atleast explicitly disable it, but it would naturally be nicer to enable
>> support if sdl2 is enabled.
>
> I dug into this a bit as well.
>
> A simple "--disable-sdl" in the QEMU config fixes the issue for 4.9.1
> and 4.10.0 Xen release. As QEMU isn't used for Xen on ARM I think this
> is a suitable fix.
>

I tested that with a build where the SDL2 headers were already
installed and the disable didn't seem to work when I added it after
the build had failed.  I'll try with a fresh build.

Matt
