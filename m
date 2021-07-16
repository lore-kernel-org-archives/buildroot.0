From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:22:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with
 wolfssl
In-Reply-To: <20210710090633.938593-1-fontaine.fabrice@gmail.com>
References: <20210710090633.938593-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716232233.4e69ca1d@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 10 Jul 2021 11:06:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build with wolfssl is broken since bump to version 3.12.1 in commit
> 4d85defa7103aadc74223868fb83ed0bed144f4d:
> 
> /data/buildroot-autobuilder/instance-0/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
> /data/buildroot-autobuilder/instance-0/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:180:32: error: 'SSL_OP_NO_SSLv3' undeclared (first use in this function); did you mean 'WOLFSSL_OP_NO_SSLv3'?
>   180 |         SSL_CTX_set_options(c, SSL_OP_NO_SSLv3 | SSL_OP_NO_TLSv1 | SSL_OP_NO_TLSv1_1);
>       |                                ^~~~~~~~~~~~~~~
>       |                                WOLFSSL_OP_NO_SSLv3
> 
> This build failure is raised by
> https://github.com/zhaojh329/libuhttpd/commit/0fb46935f0cd5f737c6f4e6053d62268aca793a7
> as since this commit, libuhttpd expects that SSL_OP_NO_xxx are defined
> by wolfssl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/79e3fa697537f2e33863e490b74ec881993eae73
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuhttpd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
