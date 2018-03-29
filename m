From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 29 Mar 2018 12:11:23 -0500
Subject: [Buildroot] Build for sama5d3 mmc doesn't boot
In-Reply-To: <CANQCQpb0Qps9np0_1jOSUL+738SfvtL7OJEx3BDRCgWD3_yO_A@mail.gmail.com>
References: <CANQCQpaS8XOo6QsuBG8XhsD8UJFyf8PMyKisNczqaTDygdAVzA@mail.gmail.com>
 <192a79cb-8ed7-291e-c91e-feac05d51453@microchip.com>
 <CANQCQpaa+wN+2t2ymGUaCy8i9JvC1SD4tFcaoqgTaK8nX0kM2A@mail.gmail.com>
 <CANQCQpb0Qps9np0_1jOSUL+738SfvtL7OJEx3BDRCgWD3_yO_A@mail.gmail.com>
Message-ID: <CANQCQpYLXHfQQTxqvXyaRa9QRUpUdmpbWW2+Dsu=gEZhKV8rsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua,

On Thu, Mar 29, 2018 at 11:26 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Joshua,
>
> On Thu, Mar 29, 2018 at 10:41 AM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> Joshua,
>>
>> On Wed, Mar 28, 2018 at 6:18 PM, Joshua Henderson
>> <joshua.henderson@microchip.com> wrote:
>>> Matthew,
>>>
>>
>>>
>>> I can reproduce.  This is fixed in at91bootstrap v3.8.10.  See here [1].
>>> Give me a bit to do some more testing and I'll update the defconfigs.
>>> In the meantime, if you're trying to get past this, set
>>> BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10" and you should
>>> be good to go.
>>>
>>> [1]: https://github.com/linux4sam/at91bootstrap/commit/fb47cd7e5fddf8b924d92ede1da61d416e7ef81c
>>
>> I tried that change to the boot strap with a buildroot toolchain GCC6
>> with the 3.8.10 and nothing output. Didn't test with GCC7, I'll kick
>> that off.
>
> 3.8.10 does work with GCC7, just not GCC6 :-(

Ignore that comment, I introduced a bug in a bad build.  GCC6/7 both
work with 3.8.10 and only GCC6 with 3.8.9 like it should

Thanks again for the help!
