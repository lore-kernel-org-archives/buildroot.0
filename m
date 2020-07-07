From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 7 Jul 2020 15:30:10 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/qemu: add spice support
In-Reply-To: <CAM=7fbdQx1Ezsag--jz-RNSmxnr0zbVYz5J_xjmx=jDOs8KasA@mail.gmail.com>
References: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
 <20200629225912.6934261e@windsurf>
 <CAM=7fbdQx1Ezsag--jz-RNSmxnr0zbVYz5J_xjmx=jDOs8KasA@mail.gmail.com>
Message-ID: <4578bcf3-b023-b16d-4d20-c537c380709a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jared, Thomas,

Le 29/06/2020 ? 23:05, Jared Bents a ?crit?:
> Hi Thomas,
> 
> 
> On Mon, Jun 29, 2020 at 3:59 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Mon, 29 Jun 2020 15:50:00 -0500
>> Jared Bents <jared.bents@rockwellcollins.com> wrote:
>>
>>> update to add qemu spice support
>>>
>>> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
>>> ---
>>>  package/qemu/Config.in | 9 +++++++++
>>>  package/qemu/qemu.mk   | 8 +++++++-
>>>  2 files changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
>>> index 33d4cccd7b..3de73b69ec 100644
>>> --- a/package/qemu/Config.in
>>> +++ b/package/qemu/Config.in
>>> @@ -127,6 +127,15 @@ config BR2_PACKAGE_QEMU_SDL
>>>  comment "SDL frontend needs a toolchain w/ dynamic library"
>>>       depends on BR2_STATIC_LIBS
>>>
>>> +config BR2_PACKAGE_QEMU_SPICE
>>> +     bool "Enable Spice frontend"
>>> +     depends on BR2_PACKAGE_SPICE
>>
>> I am wondering why for this one we are adding a sub-option and not
>> using automatic detection of BR2_PACKAGE_SPICE=y in the .mk file, like
>> you've done for VNC and usb-redir.
>>
>> On the other hand, we do have already a bunch of sub-options to
>> configure Qemu. We're not very consistent here :/

How to enable systems emulation or user-land emulation without sub-options?
What about removing BR2_PACKAGE_QEMU_SDL and BR2_PACKAGE_QEMU_FDT options and
handle the dependencies automatically?

>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> 
> I based the handling of the --enable-spice option off of an old
> upstream attempt from Yann that I had found at
> http://lists.buildroot.org/pipermail/buildroot/2012-December/063058.html
> . I don't have a preference either way so let me know if you'd prefer
> a suboption or have it automatically enabled if BR2_PACKAGE_SPICE is
> enabled similarly to the other options I've added.

I guess we should enable spice only when spice package is enabled by the user
(automatic detection).

Best regards,
Romain

> 
> Thank you,
> Jared
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
