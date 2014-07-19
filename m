From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 17:16:27 +0200
Subject: [Buildroot] [PATCH] package/libfcgi: do not build examples
In-Reply-To: <1405782180-28054-1-git-send-email-yann.morin.1998@free.fr>
References: <1405782180-28054-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140719171627.088b7660@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 19 Jul 2014 17:03:00 +0200, Yann E. MORIN wrote:
> Examples do not compile for a static build, because libtool forcibly
> wants to link against the shared version of libstdc++.so, instead of the
> static version.
> 
> Since we do not really need the examples on the target, just disable
> them, it is easier than fixing libtool.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/66e/66e19cfd5a6048d2aaa46365518ea875e0abcb4d/
>     http://autobuild.buildroot.org/results/71d/71d9ba50b41efa05a3aff06c24412d5e8b81d8f1/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks, even though I believe it's the usual libstdc++.so
problem rather than a libfcgi specific problem. But since we don't care
about examples in general, I think it's good to disable them anyway.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
