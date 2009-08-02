From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Aug 2009 09:58:15 +0200
Subject: [Buildroot] [PATCH 1/1] pciutils: fix build with external
	toolchains
In-Reply-To: <dcb752b1654d4186d02bbaa9db3b865ac03785cd.1249166245.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun\,
	2 Aug 2009 00\:37\:28 +0200")
References: <cover.1249166245.git.thomas.petazzoni@free-electrons.com>
	<cover.1249166245.git.thomas.petazzoni@free-electrons.com>
	<dcb752b1654d4186d02bbaa9db3b865ac03785cd.1249166245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878wi2tzoo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Buildroot Makefile to compile pciutils wasn't passing TARGET_LDFLAGS
 Thomas> to pciutils build system. Therefore, at link time, the pciutils build
 Thomas> system was not taking into account the important --sysroot option,
 Thomas> which was breaking the link with external toolchains.

 Thomas> Fixes bug #523.

 Thomas> +++ b/CHANGES
 Thomas> @@ -50,6 +50,7 @@
 Thomas>  	#495: Bump bind package to 9.5.1-P3 (security)
 Thomas>  	#497: OpenSSL RSA key generation hangs on x86_64
 Thomas>  	#509: Bump sqlite package to 3.6.16
 Thomas> +	#527: pciutils broken with external toolchain

523, not 527 - But I'll fix that up myself.

-- 
Bye, Peter Korsgaard
