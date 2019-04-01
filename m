From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 23:10:15 +0200
Subject: [Buildroot] [PATCH v2 2/2] pkg-generic: Cleanup some redundant
 checks
In-Reply-To: <20190317212014.3831-2-nolange79@gmail.com>
References: <20190317212014.3831-1-nolange79@gmail.com>
 <20190317212014.3831-2-nolange79@gmail.com>
Message-ID: <20190401231015.40aff37c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Sun, 17 Mar 2019 22:20:14 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> With the last change, packages will depend
> only on host-{xz,lzip} if the source archives
> have filenames requesting the corresponding compressor.
> 
> This allows using a single guard.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/pkg-generic.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

I hesitated a bit on this. Originally, I was quite in favor of the
change and found Yann's opinion a bit too strict. However, after
applying the patch, and looking at the code, I ended up feeling a bit
like Yann: even though there are less lines of code, the conditions
become a bit tricky, while currently, they are perfectly clear.

So I'll mark this patch as Rejected. Of course, if other BR maintainers
object, we can revisit, my choice is not super strong.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
