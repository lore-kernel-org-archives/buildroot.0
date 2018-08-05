From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:43:03 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <20180718123443.7242-1-casantos@datacom.com.br>
References: <20180718123443.7242-1-casantos@datacom.com.br>
Message-ID: <20180805144303.7624b65a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jul 2018 09:34:43 -0300, Carlos Santos wrote:
> Prevent creating a dangling symlink when vim is not present on the host
> machine. With BR2_ROOTFS_MERGED_USR, just link to "vim", since they are
> on the same directory, otherwise link to "../usr/bin/vim".
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/vim/vim.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I know there is some ongoing discussion on how to handle this better in
a more generic way, but until those discussions are resolved, I've
applied this patch to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
