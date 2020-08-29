From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2020 22:21:46 +0200
Subject: [Buildroot] [PATCH v2 07/12] package/busybox: fix applets
 runtime issue when building with clang cross-compiler
In-Reply-To: <20190907094027.9537-8-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-8-romain.naour@smile.fr>
Message-ID: <7164ade8-bbe7-7e0f-a25c-24daf754b7e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 11:40, Romain Naour wrote:
> Apply a patch contributed by Luis Marques on the Busybox mailing list [1]
> fixing a runtime issue (segfault) when busybox is compiled by Clang.
> 
> The patch disable the compiler optimizations for Clang/LLVM only.
> 
> Without this patch, busybox segfault with several applets
> (login on aarch64 using Clang 8.0.1, init on x86_64 using Clang 9.0.0rc3)

 We should probably check if this patch is still needed with current busybox.

 Regards,
 Arnout
