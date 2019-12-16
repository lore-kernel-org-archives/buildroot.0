From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:16:27 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/libnice: add optional
 dependency to openssl
In-Reply-To: <20190831130417.7725-2-bernd.kuhls@t-online.de>
References: <20190831130417.7725-1-bernd.kuhls@t-online.de>
 <20190831130417.7725-2-bernd.kuhls@t-online.de>
Message-ID: <20191216221627.1929b09c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Aug 2019 15:04:17 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Support for OpenSSL was added in version 0.1.15:
> https://lists.freedesktop.org/archives/nice/2018-December/001443.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libnice/Config.in  |  2 +-
>  package/libnice/libnice.mk | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

As requested by Baruch, I've extended the commit log to explain why we
need to select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS.

I've also changed the .mk file to pass
--with-crypto-library={openssl,gnutls}, and dropped the use of
--without-openssl in the gnutls case.

Applied to master with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
