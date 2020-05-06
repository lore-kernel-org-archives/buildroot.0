From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:23:36 +0200
Subject: [Buildroot] [git commit] package/libsepol: fix help text for
 BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
In-Reply-To: <20200417203421.79CD28F030@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 17 Apr 2020 22:27:56 +0200")
References: <20200417203421.79CD28F030@busybox.osuosl.org>
Message-ID: <871rnxfxgn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=67d7705a9aa58886e8a8777fe4c95746c1fb5c96
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The help text was wrong, as it didn't match the actual default values
 > we were specifying. Indeed, when we specify:

 >         default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 >         default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3

 > It means that the policy version 30 is supported starting from Linux
 > 4.3 included, and that 31 is supported from Linux 4.13 included.

 > So we shouldn't have:

 >> 4.3 <= 4.13    30
 >> 4.13           31

 > but:

 >> = 4.3 < 4.13    30
 >> = 4.13          31

 > This patch fixes that for all versions.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
