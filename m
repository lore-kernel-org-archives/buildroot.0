From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 13:44:58 +0200
Subject: [Buildroot] [PATCH next] package/asterisk: fix compilation with
 libsrtp 2.2.0
In-Reply-To: <20180823072615.32065-1-yann.morin.1998@free.fr>
References: <20180823072615.32065-1-yann.morin.1998@free.fr>
Message-ID: <20180823134458.7734aa6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 09:26:15 +0200, Yann E. MORIN wrote:
> Since commit 54797f6489 (package/libsrtp: bump version to 2.2.0),
> asterisk now chokes when configured with support for libsrtp, when
> that one has also been linked against openssl.
> 
> See:
>     https://issues.asterisk.org/jira/browse/ASTERISK-27356
> 
> Backport the upstream fix for that issue.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/4e3/4e3b0fd7c31814a8605c00f69cbd45d11800d9e3/
>     http://autobuild.buildroot.org/results/c4c/c4c241020d9e7b139b59429498b78243090245a7/
>     http://autobuild.buildroot.org/results/1c2/1c266acc0bb0518219979e8e9922f31150716118/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  ...rtp-Add-support-for-libsrtp2-with-AES-GCM.patch | 171 +++++++++++++++++++++
>  1 file changed, 171 insertions(+)
>  create mode 100644 package/asterisk/0007-res_srtp-Add-support-for-libsrtp2-with-AES-GCM.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
