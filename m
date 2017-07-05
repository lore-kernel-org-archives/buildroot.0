From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Jul 2017 16:48:04 +0200
Subject: [Buildroot] [PATCH] download: allow for BR2_PRIMARY_SITE(_ONLY)
	environment override
In-Reply-To: <20170705123359.19116-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Wed, 5 Jul 2017 14:33:59 +0200")
References: <20170705123359.19116-1-m.niestroj@grinn-global.com>
Message-ID: <87inj7ym6z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > Allow BR2_PRIMARY_SITE and BR2_PRIMARY_SITE_ONLY .config options to be
 > overriden by environment variables with the same names.

 > This is usefull for CI build environments, so primary site can be
 > overridden without .config change. That way download can be speeded up
 > if using mirror servers in the same network as CI.

You can already pass these as make arguments (E.G. make
BR2_PRIMARY_SITE=".."). Is there any real reason why that cannot be used
by the CI setup instead?

-- 
Bye, Peter Korsgaard
