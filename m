From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:27:00 +0100
Subject: [Buildroot] [PATCH] package/mediastreamer: fix build by bumping
	to version 2.14.0
In-Reply-To: <20170125202915.8084-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 25 Jan 2017 21:29:15 +0100")
References: <20170125202915.8084-1-joerg.krause@embedded.rocks>
Message-ID: <87r33qg7a3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > The current available version 2.12.1 of mediastreamer does not compile with the
 > latest version 0.27 of oRTP, which was recently updated in Buildroot in [1].
 > Bump mediastreamer to latest version 2.14.0 to fix the incompatibility:

 > ```
 > base/msfactory.c:169:3: error: too few arguments to function 'ortp_set_log_level_mask'
 >    ortp_set_log_level_mask(ORTP_MESSAGE|ORTP_WARNING|ORTP_ERROR|ORTP_FATAL);
 > ```

 > Note that we need to fetch a patch from upstream to fix the build with
 > the bctoolbox version 0.4.0.

 > Fixes:
 > http://autobuild.buildroot.net/results/9aa/9aa3cdad6e22ad1656eec59fc92fb7cb79afc4cd/
 > http://autobuild.buildroot.net/results/09e/09e8fabb72cafa284419f096da95299c51c03899/
 > http://autobuild.buildroot.net/results/29c/29c8ddd25c76f4c5b74f31a576c7ace9f76677db/
 > .. and some more.

 > [1] http://patchwork.ozlabs.org/patch/718277/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
