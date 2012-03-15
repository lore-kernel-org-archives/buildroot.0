From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 23:16:16 +0100
Subject: [Buildroot] [PATCH 3/3] config: improve help text and prompt
	for debugging related options
In-Reply-To: <39e3959f0f78242130e6b57da2b93da4f7cb1564.1331765391.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 14 Mar 2012 23:49:58 +0100")
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <39e3959f0f78242130e6b57da2b93da4f7cb1564.1331765391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k42lqzm7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The help text for the choice of different stripping levels is removed,
 Thomas> since it is not displayed by menuconfig. Instead, only the per-option
 Thomas> help text is visible, so this text is improved.

Committed with minor tweaks, thanks:
 
 Thomas>  config BR2_STRIP_strip
 Thomas>  	bool "strip"
 Thomas>  	depends on !BR2_ELF2FLT
 Thomas>  	help
 Thomas> -	  strip   is the normal strip command
 Thomas> +	  Binaries and libraries in the target filesystem will be
 Thomas> +	  stripped using the normal 'strip' command. This allows to
 Thomas> +	  save space, mainly by removing debugging symbols. Debugging
 Thomas> +	  symbols on the target are unneeded on the target when remote
 Thomas> +	  debugging is used.

I don't like the double target and the fact that we don't explain when
you would want debug symbols on the target, so I changed the last
sentence to be:

Debugging symbols on the target are needed for native debugging, but
not when remote debugging is used.

-- 
Bye, Peter Korsgaard
