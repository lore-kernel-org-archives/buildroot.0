From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jul 2020 23:43:07 +0200
Subject: [Buildroot] [PATCH] package/live555: bump version to 2020.06.25
In-Reply-To: <20200704102443.32338-1-sergio.prado@e-labworks.com>
References: <20200704102443.32338-1-sergio.prado@e-labworks.com>
Message-ID: <20200704234307.501b9112@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jul 2020 07:24:43 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Now depends on openssl. Also separate the fields in the hash file by two
> spaces.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

In fact OpenSSL is not a mandatory dependency: the linux-no-openssl
configuration provided by live555 shows that it can be built with
openssl.

So I've added a bit more logic to the .mk file to use OpenSSL only when
available, based on what the linux-no-openssl configuration is doing.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
