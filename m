From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:05:00 +0200
Subject: [Buildroot] [PATCH v2] openssl: fix m68k uclinux compile
In-Reply-To: <20160731184800.GA6199@waldemar-brodkorb.de>
References: <20160731184800.GA6199@waldemar-brodkorb.de>
Message-ID: <20160801230500.45378c06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 20:48:00 +0200, Waldemar Brodkorb wrote:
> The GCC manual suggest when getting:
> relocation truncated to fit: R_68K_GOT16O foobar
> to use -mxgot.
> 
> Fixes:
> http://autobuild.buildroot.net/results/455fd0f274bfa4bbd786bcd6740ecf960e47c1bd/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/openssl/openssl.mk |    5 +++++
>  1 file changed, 5 insertions(+)

It's somewhat annoying that we have to do this manually instead of
having the compiler switch automatically to this less efficient mode
for handling the GOT. But I guess we don't really have the choice.
Let's see how many packages need such a hack.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
