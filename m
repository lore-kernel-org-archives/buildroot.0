From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:18:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/leveldb: fix build for gcc < 5.x
In-Reply-To: <20191026192707.23083-1-bernd.kuhls@t-online.de>
References: <20191026192707.23083-1-bernd.kuhls@t-online.de>
Message-ID: <20191027101807.655c5014@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 21:27:07 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Without defining LEVELDB_HAS_PORT_CONFIG_H port/port_config.h will not
> be included:
> https://github.com/google/leveldb/blob/master/port/port_stdcxx.h#L8
> 
> which breaks endian detection. Add the define to our memenv patch to fix
> building with gcc < 5.
> __has_include was added in gcc5: https://gcc.gnu.org/gcc-5/changes.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/4ac/4ac8fbed79307326086ab294eba9e68cf208e6ac/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/leveldb/0002-CMake-install-libmemenv.a.patch | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks. Could you work with leveldb upstream to find a
solution to install the memenv library that they can accept ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
