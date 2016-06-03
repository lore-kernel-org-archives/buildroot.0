From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 16:03:42 +0200
Subject: [Buildroot] Fwd: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
In-Reply-To: <CANCHnQqhQjhG6EBapYvSODPCXjMFpLZx2AAB4bnUWuJuy4kcKg@mail.gmail.com>
References: <1455102927-28502-1-git-send-email-jer@airfi.aero>
 <CANCHnQppW3mmP=6WGBChD06+7ns0u1D5R6MQb=pxCmV6nQ7=Mw@mail.gmail.com>
 <20160603151804.41a9baa7@free-electrons.com>
 <CANCHnQqhQjhG6EBapYvSODPCXjMFpLZx2AAB4bnUWuJuy4kcKg@mail.gmail.com>
Message-ID: <20160603160342.09e52895@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 16:00:42 +0200, Jeroen Roovers wrote:

> The patch *doesn't* pass LDFLAGS down; GNU make simply picks up the
> exported LDFLAGS from buildroot and integrates it with its own flags.
> I only found out because when I set BR2_TARGET_LDFLAGS using the usual
> GCC flags and did a complete rebuild, I found that only uboot failed
> to build.

Buildroot does not export LDFLAGS, and only passes it down to packages
if it's explicitly done in the package .mk file.

Try the defconfig I posted, it built just fine, even though it has
-Wl,--as-needed in BR2_TARGET_LDFLAGS.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
