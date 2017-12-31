From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:14:43 +0100
Subject: [Buildroot] [PATCH] i2c-tools: fix missing runtime library
In-Reply-To: <dc29cedc871401a5e6ae7c4ffb67e9b092f63905.1514726745.git.baruch@tkos.co.il>
References: <dc29cedc871401a5e6ae7c4ffb67e9b092f63905.1514726745.git.baruch@tkos.co.il>
Message-ID: <20171231171443.43b9e623@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 15:25:45 +0200, Baruch Siach wrote:
> When building with dynamic library support, i2c-tools utilities are
> linked against the libi2c.so library. Current i2c-tools install commands
> don't take this into account, which leads to the following run-time
> error:
> 
> eeprog: error while loading shared libraries: libi2c.so.0: cannot open shared object file: No such file or directory
> 
> Use the native install target to fix that.
> 
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
