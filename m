From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 11:38:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnet: fix compilation with
 musl
In-Reply-To: <20161114112948.13292-2-tklauser@distanz.ch>
References: <20161114112948.13292-1-tklauser@distanz.ch>
 <20161114112948.13292-2-tklauser@distanz.ch>
Message-ID: <20161115113858.1beeb768@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 12:29:47 +0100, Tobias Klauser wrote:
> Patch taken from from upstream:
> https://github.com/sam-github/libnet/commit/ffd7fab744a9ad2893169a8fb6244074604d5d0d
> 
> Adjusted the file paths manually so the patch applies to the packaged
> libnet sources.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  package/libnet/0001-support-musl-libc.patch | 50 +++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/libnet/0001-support-musl-libc.patch

Adding the patch fixing the musl build issue is good... but if you
don't adjust the Config.in file of this package to re-enable it for
musl configurations, it's a bit useless, no?

So I've fixed that, and applied your patch to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
