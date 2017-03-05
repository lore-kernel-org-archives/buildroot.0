From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:37:23 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305213723.021d4678@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 15:34:19 +0100, Thomas Petazzoni wrote:
> The version of the khrplatform.h header bundled with odroid-mali has a
> definition of the khronos_intptr_t and khronos_ssize_t that doesn't
> match the official Khronos registry headers or the Mesa3D headers. Due
> to this, it causes conflicts with some packages that redefines those
> types (with the correct definitions), such as libepoxy.
> 
> Issue reported upstream at: https://github.com/mdrjr/c2_mali/issues/1
> 
> Since nobody bothered fixing the issue even though it has been happening
> since July 2016 (first build failure at
> http://autobuild.buildroot.net/results/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/),
> let's mark this package as BROKEN.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ca48bb6291ca16e410edb83b5cdeb24847b6eaee/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/odroid-mali/Config.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
