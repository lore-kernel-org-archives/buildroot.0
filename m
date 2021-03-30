From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:28:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/efivar: disable -Werror
In-Reply-To: <20210322070047.514146-1-fontaine.fabrice@gmail.com>
References: <20210322070047.514146-1-fontaine.fabrice@gmail.com>
Message-ID: <20210330222845.43523120@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 08:00:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 10:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/host/bin/aarch64-none-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -I/home/buildroot/autobuild/run/instance-1/output-1/build/efivar-37/src/include/   -specs=/home/buildroot/autobuild/run/instance-1/output-1/build/efivar-37/gcc.specs  -L.  -fPIC -Wl,-z,muldefs     -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o efivar efivar.c -lefivar -ldl
> In file included from efivar.h:28,
>                  from efivar.c:40:
> In function 'text_to_guid',
>     inlined from 'parse_name.constprop' at efivar.c:157:8:
> guid.h:106:2: error: 'strncpy' output may be truncated copying 8 bytes from a string of length 38 [-Werror=stringop-truncation]
>   106 |  strncpy(eightbytes, text, 8);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fcba72d359f4128515560e9105384cd4deff5043
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../efivar/0007-gcc.specs-drop-Werror.patch   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/efivar/0007-gcc.specs-drop-Werror.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
