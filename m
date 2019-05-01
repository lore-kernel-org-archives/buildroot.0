From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 1 May 2019 15:57:47 +0200
Subject: [Buildroot] [PATCH] board/qemu/ppc*: disable Werror while
 building ppc kernel with gcc >= 9.1
In-Reply-To: <27b861d5-8ead-229b-61ac-95806515d90a@mind.be>
References: <20190501125236.16786-1-romain.naour@gmail.com>
 <27b861d5-8ead-229b-61ac-95806515d90a@mind.be>
Message-ID: <4a872624-ceb5-23cb-9005-3284ffbce131@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 01/05/2019 ? 15:32, Arnout Vandecappelle a ?crit?:
> 
> 
> On 01/05/2019 14:52, Romain Naour wrote:
>> Add CONFIG_PPC_DISABLE_WERROR only for qemu ppc{64} defconfig
>> since they are used for CI with toolchain-builder's gitlab [3].
> 
>  Maybe it would be better to have a single fragment file
> board/linux-ppc-disable-werror.fragment
> and include that in all the relevant defconfigs, rather than updating each linux
> config?

I'm not sure how to handle such fragments in Buildroot.
Storing fragments in board directory seems not great.

Maybe add a new fragments directory in linux package directory:
linux/fragments/linux-ppc-disable-werror.fragment

Or a new directory configs/fragments/linux/linux-ppc-disable-werror.fragment

Thought ?

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
