From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 11:33:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/file: add libmagic.pc
In-Reply-To: <20200131194058.1161216-1-fontaine.fabrice@gmail.com>
References: <20200131194058.1161216-1-fontaine.fabrice@gmail.com>
Message-ID: <20200201113347.3a063c97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jan 2020 20:40:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/file/0001-Add-libmagic.pc.patch | 76 +++++++++++++++++++++++++
>  package/file/file.mk                    |  2 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 package/file/0001-Add-libmagic.pc.patch

Thanks, both applied. I hope the patch adding libmagic.pc will be
accepted upstream by the file developers, as otherwise we would have to
keep it forever, and the AUTORECONF = YES as well. But what you did is
the right way of fixing the issue (instead of doing a work around in
the gerbera package). We might however have to fix several other
packages to make them use pkg-config to get the details of libmagic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
