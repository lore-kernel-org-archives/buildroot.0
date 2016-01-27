From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 23:59:27 +0100
Subject: [Buildroot] [PATCH] libnspr: fix link error with musl toolchains
In-Reply-To: <1452037716-22701-1-git-send-email-sergio.prado@e-labworks.com>
References: <1452037716-22701-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160127235927.45a0ed1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Tue,  5 Jan 2016 21:48:36 -0200, Sergio Prado wrote:
> When linking against libnspr with musl toolchains we get undefined
> references to `getprotobyname_r' and `getprotobynumber_r', for example
> when compiling libnss:
> 
> /home/test/autobuild/instance-1/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libnspr4.so:
> undefined reference to `getprotobyname_r'
> /home/test/autobuild/instance-1/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libnspr4.so:
> undefined reference to `getprotobynumber_r'
> 
> That's because musl does not have an implementation of these functions,
> so we need to enable their internal implementation from libnspr.
> 
> This patch was backported from Alpine Linux commit
> a162da839db0d3f8be94a5c1ad2e2e54e691c38a.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6052538d10779a21ac242d61bb43a371497ec684/
> http://autobuild.buildroot.net/results/d62ea7dbe68188d073b4f176e6a354e95a8bab97/
> http://autobuild.buildroot.net/results/ae50521c485371cd59bc4ee7e8f323169c7d513d/
> ...
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...able-internal-getproto-functions-for-musl.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
