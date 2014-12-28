From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:42:08 +0100
Subject: [Buildroot] [PATCH] package/mke2img: always create sparse files
In-Reply-To: <1418064064-30506-1-git-send-email-yann.morin.1998@free.fr>
References: <1418064064-30506-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141228224208.1ffab60e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  8 Dec 2014 19:41:04 +0100, Yann E. MORIN wrote:
> When the user specifies a number of blocks (and we do not auto-compute
> them), the generated filesystem can be quite large with large zones with
> only zeroes in them.
> 
> Thus, always create the filesystem as a sparse file.
> 
> Sparse files behave the same as normal files, except those long runs of
> zeroes do not actually use space on the (host) filesystem. Also, this
> should not break current behaviour, as neither cp nor dd nor cat preserve
> sparseness by default. So users relying on the zeroed parts to actually
> be written won;t see a change. Users that were expressly using cp or dd
> to copy files to a sparse destination will however see a little bit of
> improvements, as the zeroed out parts won't even be read from disk.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mke2img/mke2img | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
