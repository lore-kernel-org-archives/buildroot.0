From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 15:32:15 +0200
Subject: [Buildroot] [PATCH] board/qemu/ppc*: disable Werror while
 building ppc kernel with gcc >= 9.1
In-Reply-To: <20190501125236.16786-1-romain.naour@gmail.com>
References: <20190501125236.16786-1-romain.naour@gmail.com>
Message-ID: <27b861d5-8ead-229b-61ac-95806515d90a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/05/2019 14:52, Romain Naour wrote:
> Add CONFIG_PPC_DISABLE_WERROR only for qemu ppc{64} defconfig
> since they are used for CI with toolchain-builder's gitlab [3].

 Maybe it would be better to have a single fragment file
board/linux-ppc-disable-werror.fragment
and include that in all the relevant defconfigs, rather than updating each linux
config?

 Regards,
 Arnout
