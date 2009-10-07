From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 22:36:59 +0200
Subject: [Buildroot] [PATCH 10/14] honour DISABLE_IPV6
In-Reply-To: <f77d7f5dd82b8b3945e77fd9351619fa260cff98.1254945750.git.rep.dot.nop@gmail.com>
	(Bernhard Reutner-Fischer's message of "Wed\,
	7 Oct 2009 22\:08\:33 +0200")
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
	<b01a751a32bbd1ac0bb43898ed65a6c7afd9e0c7.1254945750.git.rep.dot.nop@gmail.com>
	<ec988dfe40afe8381a2263eeaae1bd2f8ffd9014.1254945750.git.rep.dot.nop@gmail.com>
	<cover.1254945750.git.rep.dot.nop@gmail.com>
	<f77d7f5dd82b8b3945e77fd9351619fa260cff98.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <87eipfj5zo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard>   pass --disable-ipv6 to autoconfig packages if IPv6 support is turned off
 Bernhard> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
 Bernhard> ---
 Bernhard>  package/Makefile.autotools.in |    1 +
 Bernhard>  1 files changed, 1 insertions(+), 0 deletions(-)

 Bernhard> diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
 Bernhard> index d36c884..c3257cf 100644
 Bernhard> --- a/package/Makefile.autotools.in
 Bernhard> +++ b/package/Makefile.autotools.in
 Bernhard> @@ -256,6 +256,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 Bernhard>  		$(DISABLE_DOCUMENTATION) \
 Bernhard>  		$(DISABLE_NLS) \
 Bernhard>  		$(DISABLE_LARGEFILE) \
 Bernhard> +		$(DISABLE_IPV6) \

Please also remove it from the Makefile.autotools.in packages explicitly
passing it.

-- 
Bye, Peter Korsgaard
