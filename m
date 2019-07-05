From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 05 Jul 2019 19:23:43 +0530
Subject: [Buildroot] [PATCH v2] fs/tar: explicitly set extended header
 values to ensure binary reproducibility
In-Reply-To: <f790ae42-2678-78c5-bcb1-084c17b79136@mind.be>
References: <20190702173559.4423-1-itsatharva@gmail.com>
 <1831896.i2y51H8qiE@msi-manjaro>
 <f790ae42-2678-78c5-bcb1-084c17b79136@mind.be>
Message-ID: <1804310.soQp843xeh@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, July 4, 2019 10:35:48 PM IST Arnout Vandecappelle wrote:
> On 04/07/2019 20:22, Atharva Lele wrote:
> > On Thursday, July 4, 2019 11:58:21 AM IST Peter Korsgaard wrote:
> [snip]
> 
> >> Is there any use case for ever storing these in the rootfs, or should we
> >> just do this fix unconditionally?
> > 
> > Personally, I can't think of a reason why we'd want to store atime/ctime
> > in
> > the rootfs.
> 
>  ctime is pretty useless in a tarball because when extracting the ctime will
> be set to extraction time anyway (tested with -xpf as root).

Makes sense. Thanks for the explanation.

>  There might be some use for atime, but atime is already set by the "touch"
> command that preceeds the tarball creation, so it doesn't make much of a
> difference.

Fair enough. One question, does atime change again when we access the file 
when tar-ing it?

>  So yes, we probably don't need to make this depend on BR2_REPRODUCIBLE.


I agree.

-- 
Regards,
Atharva Lele
