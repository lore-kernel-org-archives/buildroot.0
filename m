From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:05:50 +0200
Subject: [Buildroot] [PATCH] lua: add patch to fix pkg-config file for
 version 5.1.x
In-Reply-To: <20171012074518.14902-1-joerg.krause@embedded.rocks>
References: <20171012074518.14902-1-joerg.krause@embedded.rocks>
Message-ID: <20171012220550.5c08ae93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Oct 2017 09:45:18 +0200, J?rg Krause wrote:
> This patch applies the fix added in commit
> 8d845683e37640d33c186c0091ccce6ae3ef0777 to Lua version 5.1.x.
> 
> When Lua is linked with additional libraries, these libraries should go
> into the pkg-config file as well.
> 
> Otherwise, linking swupdate with the lua library (version 5.1.x) fails:
> 
> ```
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlopen'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlclose'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlerror'
> /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlsym'
> ```
> 
> The build error was detected when building the package swupdate from
> upstream with Lua 5.1 compatibility support [1] enabled.
> 
> [1] https://groups.google.com/forum/#!topic/swupdate/cBvq27-zuvs
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/lua/5.1.5/0003-add-MYLIBS-to-Libs-in-lua-pc.patch | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 package/lua/5.1.5/0003-add-MYLIBS-to-Libs-in-lua-pc.patch

I have merged the other patch proposed by Fran?ois Perrad a while ago,
and marked your patch as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
