From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:48:42 +0200
Subject: [Buildroot] [PATCH 1/2] fswebcam: disable static build
In-Reply-To: <ca4b1997af710e6939f0105cc41a6bc9d0f6c849.1397371457.git.baruch@tkos.co.il>
References: <ca4b1997af710e6939f0105cc41a6bc9d0f6c849.1397371457.git.baruch@tkos.co.il>
Message-ID: <20140414224842.3783772d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 13 Apr 2014 09:44:16 +0300, Baruch Siach wrote:
> fswebcam doesn't play nicely with static build as it doesn't track its
> indirect dependencies in link time. Fixing this requires tracking all indirect
> optional dependencies, which is tedious and error prone. Just disable static
> build.
> 
> This build failure didn't show on the autobuilder for some reason.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/fswebcam/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Both applied. I would have preferred to fix static linking, but I agree
it's pretty unlikely that anyone will ever use such an application
statically linked and so it's probably not worth the effort.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
