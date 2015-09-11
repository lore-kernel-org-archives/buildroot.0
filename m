From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 11 Sep 2015 12:09:33 +0200
Subject: [Buildroot] [PATCH] android-tools: add target and adbd support
In-Reply-To: <20150911112741.1d9a97d7@free-electrons.com>
References: <1441963430-1326-1-git-send-email-gary.bisson@boundarydevices.com>
 <20150911112741.1d9a97d7@free-electrons.com>
Message-ID: <CAAMH-ytXnvc1THWyY_vpzL3sSGM4rgJnuKtV-nTjkEt1TmE_Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 11, 2015 at 11:27 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Gary,
>
> On Fri, 11 Sep 2015 11:23:50 +0200, Gary Bisson wrote:
>> Required to switch from the Debian to the Ubuntu package as the former
>> doesn't offer adbd support. That change allows to get rid the
>> AndroidConfig.h as everything is defined in the Makefiles.
>>
>> Regarding adbd, the target is required to have the FunctionFS USB Gadget
>> configuration. Then the following commands enable the use of adb:
>>  # modprobe g_ffs idVendor=0x18d1 idProduct=0x4e42 \
>>    iSerialNumber="buildroot"
>>  # mkdir -p /dev/usb-ffs/adb
>>  # mount -t functionfs adb /dev/usb-ffs/adb -o uid=2000,gid=2000
>>  # adbd &
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> Thanks for working on this!
>
>> This is a first draft and I'll obviously need to respin once a v3 of
>> their patch will be delivered. I don't know if it would even be
>> better to squash both patches and have one android-tools patch only.
>
> I think you can squash both patches, and send a single patch
> implementing the entire package. Feel free to re-use my patch and put
> your authorship instead of mine, I don't care.

Ok I'll offer a squashed version soon. Authorship doesn't bother me
either, the simplest is to keep yours, I'll just add my SOB (and
Antoine's as requested in v2 comments).

>> I was surprised not to see "select" in the Config.in.host for zlib
>> or openssl but only at dependencies in the .mk file. Is that on
>> purpose?
>
> Host packages don't have Config.in options, except for a few exceptions.

Ok I'll fix my Config.in to have the select.

Thanks,
Gary
