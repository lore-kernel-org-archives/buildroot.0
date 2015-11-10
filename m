From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Tue, 10 Nov 2015 19:21:26 +0900
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
	for target, fix a typo
In-Reply-To: <20151110104858.6c49b759@free-electrons.com>
References: <201511100922.tAA9Ml77000486@ms-omx02.plus.so-net.ne.jp>
 <20151110104858.6c49b759@free-electrons.com>
Message-ID: <E219834A-E8E4-4AF5-974C-45B03804F2A2@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

> 2015/11/10 18:48?Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ?????
> 
> Hiroshi,
> 
> On Tue, 10 Nov 2015 18:22:47 +0900, Hiroshi Kawashima wrote:
>> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> 
> Thanks for this patch. Also, I think you should have a look at the
> autobuilder failures for gauche, it fails to build in a number of
> situations. See:
> 
>   http://autobuild.buildroot.org/?reason=gauche-0.9.4
> 
> Some cases are due to unsupported architecture (example: xtensa), some
> cases are due to the external libatomic_ops being built before gauche,
> and therefore used by gauche instead of its internal copy, causing some
> build failures, etc.
> 
Sure.
Most problems seems to be architectures that boehm gc not ported.
Would you suggest how can I control these case in Config.in ?
(eg. gauche is not supported on xtensa, disable selecting gauche package
for xtensa architecture).

Regards,
Kawashima

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
