From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 09:15:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix static build on
 x86_64
In-Reply-To: <20191015214644.31476-1-fontaine.fabrice@gmail.com>
References: <20191015214644.31476-1-fontaine.fabrice@gmail.com>
Message-ID: <20191016091529.5a03c63b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 23:46:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use no-asm when building statically on x86_64, see
> https://github.com/openssl/openssl/issues/9839
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Is the problem specific to x86-64 ? Reading the Github issue, the
OpenSSL developer apparently says that whenever the "generic"
architecture variants are used, no-asm should be passed as well. This
is not really what your patch is doing.

Could you clarify this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
