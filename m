From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:55:57 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: disable clang
In-Reply-To: <20181103140609.4528-1-fontaine.fabrice@gmail.com>
References: <20181103140609.4528-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103155557.3c0cb017@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 15:06:09 +0100, Fabrice Fontaine wrote:
> For the time being, disable clang that is used to build BPF (in-kernel
> bytecode machine) protocols.
> Indeed, if an old version of clang is found on the host, it could be
> used to build object files with a "None" architecture which will be
> rejected by support/scripts/check-bin-arch
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libv4l/libv4l.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
