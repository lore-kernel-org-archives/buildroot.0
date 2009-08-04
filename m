From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Aug 2009 22:57:33 +0200
Subject: [Buildroot] [PATCH 1/1] sed: fix compilation with external
	toolchains
In-Reply-To: <6ce736a58c8973ceba56bc95f11118b7c1351f11.1249415132.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue\,
	4 Aug 2009 21\:48\:00 +0200")
References: <cover.1249415132.git.thomas.petazzoni@free-electrons.com>
	<cover.1249415132.git.thomas.petazzoni@free-electrons.com>
	<6ce736a58c8973ceba56bc95f11118b7c1351f11.1249415132.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vdl3pa9u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since CC is already passed in TARGET_CONFIGURE_OPTS at ./configure
 Thomas> time, there's no point in overriding it with a wrong value at
 Thomas> compilation time. This breaks external toolchain builds since
 Thomas> CC=$(TARGET_CC) is wrong because it excludes the mandatory --sysroot
 Thomas> option.

 Thomas> Fixes bug #525

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  CHANGES            |    1 +
 Thomas>  package/sed/sed.mk |    2 +-
 Thomas>  2 files changed, 2 insertions(+), 1 deletions(-)

 Thomas> diff --git a/CHANGES b/CHANGES
 Thomas> index 0c1f667..36b9b45 100644
 Thomas> --- a/CHANGES
 Thomas> +++ b/CHANGES
 Thomas> @@ -77,6 +77,7 @@
 Thomas>  	#497: OpenSSL RSA key generation hangs on x86_64
 Thomas>  	#509: Bump sqlite package to 3.6.16
 Thomas>  	#523: pciutils broken with external toolchain
 Thomas> +	#525: sed broken with external toolchain

This should preferably go after -rc1, but I'll fix that for you.

-- 
Bye, Peter Korsgaard
