From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 19:08:40 +0200
Subject: [Buildroot] [PATCH 1/2] lua: fix pkg-config file
In-Reply-To: <20170731211800.5888-1-joerg.krause@embedded.rocks>
References: <20170731211800.5888-1-joerg.krause@embedded.rocks>
Message-ID: <20170801190840.457a6f6d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 23:17:59 +0200, J?rg Krause wrote:
> When Lua is linked with additional libraries, these libraries should go
> into the pkg-config file as well.
> 
> Otherwise, linking swupdate with the lua library fails:
> 
> ```
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlopen'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlclose'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlerror'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlsym'
> ```
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Is this fixing an autobuilder issue ? I guess it should fix the ones
you mention in PATCH 2/2, but obviously only for the supported Lua
versions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
