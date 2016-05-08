From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 8 May 2016 16:39:07 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 1/1] uboot-tools: add missing dependency
 on host-dtc for the host package
In-Reply-To: <20160506152539.121b536c@free-electrons.com>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
 <20160506152539.121b536c@free-electrons.com>
Message-ID: <1410733015.14174716.1462736347333.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Friday, May 6, 2016 10:25:39 AM
> Subject: Re: [Buildroot] [PATCH v2 1/1] uboot-tools: add missing dependency on host-dtc for the host package

> Hello,
> 
> On Fri,  6 May 2016 08:59:13 -0300, Carlos Santos wrote:
>> The mkimage utility needs dtc when support for Flat Image Trees (FIT)
>> is enabled. If dtc is not available mkimage may fail. Example:
>> 
>>     $ mkimage -f firmware.its firmware.im
>>     sh: dtc: command not found
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> Thanks for this new version. Unfortunately, this patch is incorrect, as
> it badly mixes things for the target version of uboot-tools with things
> for the host version of uboot-tools.

Thanks for the review. After analyzing the package deeply I noticed that it has additional problems and that U-Boot needs an additional patch to allow turning FIT support on/off. I will send a new patch to solve these problems.

Carlos Santos (Casantos)
DATACOM, P&D
