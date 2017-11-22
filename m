From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:46:14 +0100
Subject: [Buildroot] [PATCH] util-linux: explicitly use /usr/{bin, sbin,
 lib}, with merged usr
In-Reply-To: <20171109000533.26181-1-casantos@datacom.ind.br>
References: <20171108234258.15035-1-casantos@datacom.ind.br>
 <20171109000533.26181-1-casantos@datacom.ind.br>
Message-ID: <20171122224614.2d6ec602@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 22:05:33 -0200, Carlos Santos wrote:
> Prevent the installation from attempting to move shared libraries from
> ${usrlib_execdir} to ${libdir} if both paths are the same, which leads
> to error messages like this:
> 
>   mv: '$(TARGET_DIR)/usr/lib/libfoo.so.1' and '$(TARGET_DIR)/lib/libfoo.so.1' are the same file
> 
> That error is not fatal but let's avoid possible future problems.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> Changes v1->v2:
>   Fix commit message to remove spurious "not".
> ---
>  package/util-linux/util-linux.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
