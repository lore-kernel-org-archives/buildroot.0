From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 19 Aug 2017 18:58:05 +0200
Subject: [Buildroot] [PATCH] board/boundarydevices: add mac parameter
 for BD-SDMAC in bootscript
In-Reply-To: <20170819151929.5c9fd2f7@windsurf>
References: <20170818141552.1749-1-gary.bisson@boundarydevices.com>
 <20170819151929.5c9fd2f7@windsurf>
Message-ID: <CAAMH-yuONc5YYdEk1KAT7zAvoaWyEBN3q2zRi87439_+DEhdDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Aug 19, 2017 at 3:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 18 Aug 2017 16:15:52 +0200, Gary Bisson wrote:
>> Our new WiFi 802.11ac BT4.1 module (BD-SDMAC [1]) driver allows to
>> override the wlan MAC address using a module parameter.
>>
>> Since its driver is now included in our external repository [2], update
>> the bootscript so it sets the parameter for that driver too.
>>
>> As a FYI, $wlmac is based on Ethernet MAC address located in fuses.
>>
>> [1] https://boundarydevices.com/product/bd_sdmac_wifi/
>> [2] https://github.com/boundarydevices/buildroot-external-boundary
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>>  board/boundarydevices/common/6x_bootscript.txt | 1 +
>>  1 file changed, 1 insertion(+)
>
> Applied to master, thanks. However, I'm wondering why all this BD-SDMAC
> WiFi support packages remain out of tree in your BR2_EXTERNAL. Would it
> make sense to upstream them in Buildroot ?

My main issue is that we've been asked, for dubious reasons, to hide
the firmware files on a private git repo which requires to register to
our website to get access to.

Moreover this driver is based on qcacld-2.0 repository [1] whose build
breaks easily depending on the kernel you build against.

Finally it has only been tested on BD-SDMAC module so I'm not sure
that many people are interested (except for our customers).

Let me know your thoughts.

Regards,
Gary

[1] https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qcacld-2.0/
