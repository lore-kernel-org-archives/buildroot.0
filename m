From: Jaap Crezee <jaap@jcz.nl>
Date: Fri, 24 Jul 2015 12:04:13 +0200
Subject: [Buildroot] [PATCH 1/1] Fix ncurses gcc-5.0 compile issue (for
 real)
In-Reply-To: <1437679186-15114-1-git-send-email-bas@bmail.ru>
References: <1437679186-15114-1-git-send-email-bas@bmail.ru>
Message-ID: <55B20D9D.5050201@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/23/15 21:19, kyak wrote:
> The previous patch didn't work in all cases. The new patch is taken from
> upstream:
> 
> http://ncurses.scripts.mit.edu/?p=ncurses.git;a=blobdiff;f=ncurses/base/MKlib_gen.sh;h=b91398c740a266f10edbbce19f19c52b9709556f;hp=d8cc3c9751faa157d0c8cb8e16fbe4217703966b;hb=97bb4678dc03e753290b39bbff30ba2825df9517;hpb=762520a7930d7f698d542628d3c04bc201f7dac2
> Signed-off-by: kyak <bas@bmail.ru>
> ---
>  package/ncurses/0002-gcc-5.x-MKlib_gen.patch | 60 +++++++++++++---------------
>  1 file changed, 28 insertions(+), 32 deletions(-)

Acked-by: Jaap Crezee <jaap@jcz.nl>

However: the patch does NOT work here, it does not apply;

[jaap at jaap /data/work/zupr/ZUPR-Embedded-Buildroot ]$ cat p.patch | patch -Np1
patching file package/ncurses/0002-gcc-5.x-MKlib_gen.patch
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file
package/ncurses/0002-gcc-5.x-MKlib_gen.patch.rej
[jaap at jaap /data/work/zupr/ZUPR-Embedded-Buildroot ]$

regards,


Jaap Crezee
