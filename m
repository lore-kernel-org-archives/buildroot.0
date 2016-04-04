From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 4 Apr 2016 13:50:06 -0700
Subject: [Buildroot] [PATCH] linux: use zImage by default on ARM
In-Reply-To: <5702D130.5090502@mind.be>
References: <1459452866-23060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAJJ6jxu=KscT+V-fAiqo16E673tnk7Zo2j+=OaVqicQYQ4YVUg@mail.gmail.com>
 <5702D130.5090502@mind.be>
Message-ID: <CAJJ6jxsL7T5a88vM9qfxySwwFajAR-9fwHdHA8hsMEcBRoVWAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 4, 2016 at 1:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/04/16 19:57, Steve Calfee wrote:
>>
>> On Thu, Mar 31, 2016 at 12:34 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>>
>>> Since quite some time, the kernel and bootloader communities consider
>>> zImage as the default format for kernel images on ARM, replacing
>>> uImage. The load address information in uImage is no longer needed,
>>> since the kernel is position-independent in terms of physical address,
>>> except on a few old platforms. For most people, using zImage is simply
>>> better/simpler, so let's switch to zImage as the default image format
>>> on ARM.
>>>
>>> All defconfigs are updated: 46 defconfigs no longer need to select
>>> explicitly zImage because it's the default, and 16 defconfigs now need
>>> to explicitly select uImage because that's no longer the default.
>>>
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> ---
>>
>>
>> Is this a good idea? Doesn't this break external configs that use
>> uImage? Changing a default is a serious change.
>
>
>  A defconfig is not very reliable when updating buildroot, because defaults
> may change. When updating buildroot, you should use a full config. This also
> tells you which options are new for example.
>
I guess I misunderstood. I thought that if no kernel image was
selected in a buildroot config, this patch changed from defaulting to
uImage to zImage. In fact that is not the case, looking at an existing
out-of-kernel config does have BR2_LINUX_KERNEL_UIMAGE=y set. So this
won't be broken.

So if these changes only affect the addressed defconfigs, which in
fact probably are not ever really used (except to start building a
projects own defconfig), there will be no breakage.

Sorry about the noise,

Steve
