From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:02:29 +0100
Subject: [Buildroot] [PATCH] xfsprogs: Define PLATFORM to linux
In-Reply-To: <1543467940-5231-1-git-send-email-f.fainelli@gmail.com> (Florian
 Fainelli's message of "Wed, 28 Nov 2018 21:05:40 -0800")
References: <1543467940-5231-1-git-send-email-f.fainelli@gmail.com>
Message-ID: <87wooq2rre.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:

 > PLATFORM is an environment variable used by xfsprogs' configure script
 > to determine the platform for which the applications are being built. If
 > we set some incorrect/unsupported value through e.g: export, this will
 > be picked up by xfsprogs' configure script and used as-is and assigned
 > to PKG_PLATFORM, which will lead to build failures.

 > If PLATFORM was empty/unset, then uname on the host building xfsprogs
 > gets used to determine the build platform, which again could be
 > incorrect if we e.g: built xfsprogs on a Darwin system.

 > Since we are obviously building for Linux, let's just make sure we
 > define it that way which solves both issues.

 > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
