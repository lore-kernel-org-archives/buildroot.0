From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 16:59:38 +0100
Subject: [Buildroot] [PATCH 11/16] package infrastructure: add
	LD_LIBRARY_PATH
In-Reply-To: <14420c94fda9f27c457b671f0da2a278cba23ac6.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:43:02 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<14420c94fda9f27c457b671f0da2a278cba23ac6.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ocjhi7md.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> During the compilation of target packages, host tools might be used,
 Thomas> and in turn, they might use host libraries installed in
 Thomas> $(HOST_DIR)/usr/lib. Therefore, we pass a LD_LIBRARY_PATH variable
 Thomas> when building packages.
 
 Thomas> -TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
 Thomas> +# During the compilation of target packages, host tools might be used,
 Thomas> +# and in turn, they might use host libraries installed in
 Thomas> +# $(HOST_DIR)/usr/lib
 Thomas> +TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
 Thomas> +		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"

We should probably append to LD_LIBRARY_PATH in case it is set already.

-- 
Bye, Peter Korsgaard
