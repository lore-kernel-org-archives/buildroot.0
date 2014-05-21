From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 21 May 2014 08:22:52 +0300
Subject: [Buildroot] [PATCH] ruby: fix build with recent openssl versions
In-Reply-To: <87k39ggooi.fsf@dell.be.48ers.dk>
References: <1400594769-31393-1-git-send-email-fatih.asici@gmail.com>
 <87k39ggooi.fsf@dell.be.48ers.dk>
Message-ID: <201405210822.52997.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 20 May 2014 23:50:21 Peter Korsgaard wrote:
> >>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:
>  > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> 
> What exact problem is it fixing? I just tried building ruby+openssl
> without problems.

OpenSSL version on my system (Debian Wheezy) is 1.0.1e-2+deb7u9. When
building host-ruby it fails because of an undefined macro:

make[3]: Entering directory `/home/fatih/git/buildroot/output/build/host-ruby-1.9.3-p545/ext/openssl'
compiling ossl_ssl.c
ossl_ssl.c: In function ?Init_ossl_ssl?:
ossl_ssl.c:1988:79: error: ?SSL_OP_MSIE_SSLV2_RSA_PADDING? undeclared (first use in this function)
ossl_ssl.c:1988:79: note: each undeclared identifier is reported only once for each function it appears in
make[3]: *** [ossl_ssl.o] Error 1
make[3]: Leaving directory `/home/fatih/git/buildroot/output/build/host-ruby-1.9.3-p545/ext/openssl'
