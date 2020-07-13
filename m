From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jul 2020 23:24:17 +0200
Subject: [Buildroot] [PATCH 4/4] board/qemu/aarch64-virt/linux.config:
 enable memory hotplug
In-Reply-To: <20200712212704.43b4671a@windsurf.home>
References: <20200712163422.1162187-1-romain.naour@gmail.com>
 <20200712163422.1162187-4-romain.naour@gmail.com>
 <20200712212704.43b4671a@windsurf.home>
Message-ID: <c9303224-0b26-14dc-ca93-a4f899b3c588@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 12/07/2020 ? 21:27, Thomas Petazzoni a ?crit?:
> On Sun, 12 Jul 2020 18:34:22 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> To test memory hotplug [1], add -m 1G,slots=3,maxmem=4G to the qemu command
>> line, boot the system and enter the following command in the Qemu monitor
>> to add another 1GB to the guest:
>> (use ctrl+a c to switch from the serial port and Qemu monitor):
>>
>>    (qemu) object_add memory-backend-ram,id=mem1,size=1G
>>    (qemu) device_add pc-dimm,id=dimm1,memdev=mem1
>>
>> [1] https://git.qemu.org/?p=qemu.git;a=blob;f=docs/memory-hotplug.txt;h=6aa5e17e26090f619787de7b71888093fb9d0117;hb=fdd76fecdde1ad444ff4deb7f1c4f7e4a1ef97d6#l9
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Is this really something we want to enable in a defconfig ? It feels
> like a very advanced/specific feature, not really relevant for a
> demo/test defconfig IMO.

We just the required kernel options need for memory hot-plug, the Qemu command
line in the readme.txt is keep as is.

Best regards,
Romain

> 
> Thomas
> 
