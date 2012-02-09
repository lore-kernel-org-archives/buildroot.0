From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 22:05:56 +0100
Subject: [Buildroot] [PATCH 2 of 5 v6] dependencies: check minimal make
	version early on
In-Reply-To: <524d33227f44ddf99ac9.1328718137@beantl019720> (Thomas De
 Schampheleire's message of "Wed, 08 Feb 2012 17:22:17 +0100")
References: <patchbomb.1328718135@beantl019720>
 <524d33227f44ddf99ac9.1328718137@beantl019720>
Message-ID: <87k43v4szv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Although support/dependencies/dependencies.sh checks for the
 Thomas> version of make, this script doesn't get a chance to run if
 Thomas> make encounters a syntax error as a result of being too old.

 Thomas>  export BR2_VERSION:=2012.02-git
 
 Thomas> +# Check for minimal make version (note: this check will break
 Thomas> at make 10.x)

 Thomas> +MIN_MAKE_VERSION=3.81
 Thomas> +ifeq (,$(filter $(MIN_MAKE_VERSION),$(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION)))))

It seems simpler to just compare with MAKE_VERSION, so I changed it to
be:

ifeq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MAKE_VERSION))

Committed, thanks.

-- 
Bye, Peter Korsgaard
