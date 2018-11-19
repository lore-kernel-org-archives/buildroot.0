From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 15:56:48 +0100
Subject: [Buildroot] [PATCH 3/3] make: install host-make as host-make
In-Reply-To: <31929_1542638135_5BF2CA37_31929_18_1_20181119143525.GA25610@r-lnx-nyma7486-2>
 (yann morin's message of "Mon, 19 Nov 2018 15:35:25 +0100")
References: <20181119140228.19937-1-peter@korsgaard.com>
 <20181119140228.19937-3-peter@korsgaard.com>
 <31929_1542638135_5BF2CA37_31929_18_1_20181119143525.GA25610@r-lnx-nyma7486-2>
Message-ID: <877eh9qfnz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

Hi,

 >> +# Rename host-make binary to ensure it isn't accidently used by
 >> +# packages when they invoke recursive / sub-make.
 >> +define HOST_MAKE_RENAME_BINARY
 >> +	mv $(HOST_DIR)/bin/make $(HOST_DIR)/bin/host-make
 >> +endef
 >> +HOST_MAKE_POST_INSTALL_HOOKS += HOST_MAKE_RENAME_BINARY

 > Why not simply:

 >     HOST_MAKE_CONF_OPTS += --program-prefix=host-

Ehh, because I wasn't aware of it. I'll give it a try - Thanks.

 > Regards,
 > Yann E. MORIN.

 > PS. Let's see if I can post from this email, now! ;-)

It works! ;)

-- 
Bye, Peter Korsgaard
