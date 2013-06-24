From: Jan Pohanka <xhpohanka@gmail.com>
Date: Mon, 24 Jun 2013 13:18:37 +0200
Subject: [Buildroot] why to have separate uboot-tools?
In-Reply-To: <51C82A53.90403@zacarias.com.ar>
References: <51C825B8.6070800@gmail.com> <51C82A53.90403@zacarias.com.ar>
Message-ID: <51C82B0D.2040105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dne 24.6.2013 13:15, Gustavo Zacarias napsal(a):
> On 06/24/2013 07:55 AM, Jan Pohanka wrote:
>
>> Hi all,
>>
>> currently I'm trying to customize buildroot a bit to allow it to be used
>> by my colleagues as a base of their development environment.
>> I have noticed that there is separate package for u-boot-tools (mkimage,
>> etc.) Can please someone tell me why these tools are not installed from
>> u-boot package defined in bootloaders section?
>>
>> Once we use our own u-boot with its own tools (uflash from TI) I need to
>> alter two packages and also u-boot sources are downloaded two times.
>> I can prepare a patch to use just u-boot in bootloaders section, but the
>> question is if it is not worthless...
> Hi.
> Because maybe you are just building an uImage and not the bootloader for
> your target?
> Hence saving time building a complete bootloader and (also) maybe you
> lack the customized bootloader source to build a complete target which
> would preclude you from building just the tools which don't have
> board-specific bits. (not saying this is nice, but it happens sometimes)
> Regards.
>
Hi,
I'm reconsidering it once again and it seems that current approach is 
probably the best... anyway thank you for answer.

regards
