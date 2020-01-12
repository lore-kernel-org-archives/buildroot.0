From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:22:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: enable back on musl with
 headers >= 4.15
In-Reply-To: <20200111220824.1892590-1-fontaine.fabrice@gmail.com>
References: <20200111220824.1892590-1-fontaine.fabrice@gmail.com>
Message-ID: <20200112222210.1d287140@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 23:08:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> olsr has been disabled on musl three years ago by commit
> 4bca88c839e54a9140c06010666f5e034127b8b1.
> 
> Comments in https://github.com/OLSR/olsrd/issues/6 suggest that the
> issue was due to olsr mixing kernel and userspace headers. This issue is
> still open.
> 
> However, nowadays olsr builds fine on musl under those two conditions:
> - musl >= 1.1.16 (i.e. with
>   http://git.musl-libc.org/cgit/musl/commit/?id=04983f2272382af92eb8f8838964ff944fbb8258)
> - kernels >= 4.15 (i.e. with
>   https://github.com/torvalds/linux/commit/c0bace798436bca0fdc221ff61143f1376a9c3de)
> 
> So enable it back on musl with kernels >= 4.15.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/olsr/Config.in | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
