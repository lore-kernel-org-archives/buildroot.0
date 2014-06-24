From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Jun 2014 20:35:07 +0200
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <CANxTyt5ZXLgZ43QYu4BN6TPrxjX-qME=XMVL_mFw5oCUe5R3XA@mail.gmail.com>
References: <patchbomb.1403444739@localhost>
 <97d74ccbe054d9a16465.1403444740@localhost>
 <20140622185233.0d553f8d@free-electrons.com>
 <f2f7913c-0555-46d8-9e41-9a8099a8c683@email.android.com>
 <CANxTyt5VxZd9gKc7Ft-3UDxyWSSsb+iP3vrAVd1m=6vr54KPgA@mail.gmail.com>
 <CAAXf6LVLsBq1Mh2eN+48SV0aYq_tBM-ZnRFSL=UTLReAxySNSg@mail.gmail.com>
 <CANxTyt5ZXLgZ43QYu4BN6TPrxjX-qME=XMVL_mFw5oCUe5R3XA@mail.gmail.com>
Message-ID: <CAAXf6LXVFYfPxEN8HPs6KDBC6x67TnF-9NhPeZ-eMrN1NQuttw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Sun, Jun 22, 2014 at 9:07 PM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> On Sun, Jun 22, 2014 at 2:52 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> Hi Danomi,
>>
>> On Sun, Jun 22, 2014 at 7:29 PM, Danomi Manchego
>> <danomimanchego123@gmail.com> wrote:
>>> How about moving the XXX_COPY_CONFIG to the top of the
>>> .stamp_config_file_fixed actions, and then make xxxx-menuconfig update
>>> on that too?
>>>
>>> That might be nicer than, say, changing the added COPY in the
>>> xxxx-menuconfig to a "[ -f $(XXXX_BUILD_CONFIG) ] ||
>>> $(XXXX_COPY_CONFIG)"
>>
>> I'm not sure I fully get what you mean, can you elaborate?
>
> I was actually looking more at the busybox mods than the uclibc mods.
> The busybox .stamp_config_file_fixed target doesn't do the COPY
> action.   My thinking is that the COPY only needs to be done once; so
> using a stamp target that runs the XXXX_COPY_CONFIG seems suitable.
> Then all the make targets that did a COPY, and the targets that you're
> patching to do a COPY, can instead depend on such a stamp.  The
> .stamp_config_file_fixed targets seem like good candidates - have the
> COPY done once before any other targets that assume it's been done,
> and then don't do it again.

The copy cannot be added to the config_file_fixed target, because we
need a separate target that does _not_ do a copy, to be used from the
update_config target...

Best regards,
Thomas
