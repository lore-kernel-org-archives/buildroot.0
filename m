From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:57:21 +0200
Subject: [Buildroot] [PATCH] binutils: fix 'call8: call target out of
 range' xtensa ld bug
In-Reply-To: <1411442609-24398-1-git-send-email-jcmvbkbc@gmail.com>
References: <1411442609-24398-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140923215721.214801d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue, 23 Sep 2014 07:23:29 +0400, Max Filippov wrote:
> This fixes the following linux kernel build errors:
> 
>   LD      init/built-in.o
>   net/built-in.o: In function `raw_proc_exit':
>   (.init.text+0xe29): dangerous relocation:
> 		      call8: call target out of range: udp_proc_register
>   net/built-in.o: In function `udp_table_init':
>   (.init.text+0xf09): dangerous relocation:
> 		      call8: call target out of range: udp_proc_register
>   net/built-in.o: In function `inet_init':
>   af_inet.c:(.init.text+0x142e): dangerous relocation:
> 				 call8: call target out of range: udp4_proc_exit
>   net/built-in.o: In function `ip_auto_config':
>   ipconfig.c:(.init.text+0x28aa): dangerous relocation:
> 				  call8: call target out of range: arp_send
> 
> Backported from: 331ed1307b93d3ff77d248bdf2f7b79a20851457
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...-target-out-of-range-xtensa-ld-relaxation.patch | 79 ++++++++++++++++++++++
>  ...-target-out-of-range-xtensa-ld-relaxation.patch | 79 ++++++++++++++++++++++
>  ...-target-out-of-range-xtensa-ld-relaxation.patch | 79 ++++++++++++++++++++++
>  3 files changed, 237 insertions(+)
>  create mode 100644 package/binutils/2.22/904-Fix-call8-call-target-out-of-range-xtensa-ld-relaxation.patch
>  create mode 100644 package/binutils/2.23.2/904-Fix-call8-call-target-out-of-range-xtensa-ld-relaxation.patch
>  create mode 100644 package/binutils/2.24/904-Fix-call8-call-target-out-of-range-xtensa-ld-relaxation.patch

Thanks, patch applied. I have no idea what it does, but since it's an
upstream backport, and it touches only Xtensa stuff, I'm fine :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
