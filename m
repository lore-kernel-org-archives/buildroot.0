From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 16:18:18 +0200
Subject: [Buildroot] libcurl: propagate buildroot debugging option
In-Reply-To: <6e5e28bc-b89a-931e-be6c-98c2ebb5434f@awox.com>
References: <6e5e28bc-b89a-931e-be6c-98c2ebb5434f@awox.com>
Message-ID: <20170429161818.0d541857@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Apr 2017 17:42:16 +0200, Olivier Valentin wrote:
> When buildroot has debugging enabled, let libcurl configure
> its build accordingly.
> 
> Signed-off-by: Olivier Valentin <ovalentin@awox.com>

Thanks, but since commit
https://git.buildroot.org/buildroot/commit/?id=0552a367dbdc27a211daaac3359d81dd537e384f,
we no longer pass --enable-debug/--disable-debug to packages. Indeed,
we have realized that packages are not consistent in what they do when
--enable-debug/--disable-debug is passed.

So, BR2_ENABLE_DEBUG is nowadays *only* to get packages built with
debugging symbols, and this is controlled by adding "-g" to CFLAGS.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
