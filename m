From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 23:26:38 +0100
Subject: [Buildroot] [PATCH 03/15] toolchain: add support for external
	toolchain profiles and download
In-Reply-To: <3a0463ff0daf67faf5c2b278726c84d70084029b.1291541115.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 10:25:30 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<3a0463ff0daf67faf5c2b278726c84d70084029b.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k4jglzdt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Instead of letting the user define all the details of his external
 Thomas> toolchain, we define a set of profiles for well-known external
 Thomas> toolchains (CodeSourcery ones only at the moment, can easily be
 Thomas> extended with other toolchains).

 Thomas> Once a profile has been choosen, the user is offered the choice of
 Thomas> either letting Buildroot download and install the external toolchain,
 Thomas> or (as before) to tell Buildroot where the toolchain is installed on
 Thomas> the system.

 Thomas> We of course provide a "custom profile", through which the user can
 Thomas> configure Buildroot to use a custom external toolchain for which no
 Thomas> profile is available.


 Thomas> +++ b/toolchain/toolchain-external/Config.in
 
 Thomas>  config BR2_TOOLCHAIN_EXTERNAL_STRIP
 Thomas>  	bool
 Thomas>  	default y
 Thomas> +	depends on BR2_TOOLCHAIN_EXTERNAL

This is all in an if BR2_TOOLCHAIN_EXTERNAL conditional. Did you mean
BR2_TOOLCHAIN_EXTERNAL_CUSTOM instead?

 Thomas>  	prompt "Strip shared libraries"
 Thomas>  	help
 Thomas>  	  Strip shared libraries copied from the external toolchain.
 Thomas> -endif
 Thomas> +
 Thomas> +endif # BR2_TOOLCHAIN_EXTERNAL
 Thomas> +

-- 
Bye, Peter Korsgaard
