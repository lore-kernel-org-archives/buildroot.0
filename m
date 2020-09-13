From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 21:39:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/htpdate: fix build with static
 openssl
In-Reply-To: <20200912150527.228019-1-titouan.christophe@railnova.eu>
References: <20200912150527.228019-1-titouan.christophe@railnova.eu>
Message-ID: <20200913213954.3cc0af7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Sep 2020 17:05:27 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Depending on its build configuration, openssl might not be compiled with
> dynamic zlib support, and programs that link against openssl need to link
> against zlib as well.
> 
> This can be generally and easily handled using the pkg-config files
> installed by openssl.
> 
> Fixes: http://autobuild.buildroot.net/results/ae9/ae946ca72238840b3eaa5fe823e8d620618f7462/
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  ...-config-to-determine-openssl-LDFLAGS.patch | 36 +++++++++++++++++++
>  package/htpdate/htpdate.mk                    |  2 +-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
