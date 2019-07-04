From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 19:05:48 +0200
Subject: [Buildroot] [PATCH v2] fs/tar: explicitly set extended header
 values to ensure binary reproducibility
In-Reply-To: <1831896.i2y51H8qiE@msi-manjaro>
References: <20190702173559.4423-1-itsatharva@gmail.com>
 <87a7duz52y.fsf@dell.be.48ers.dk> <1831896.i2y51H8qiE@msi-manjaro>
Message-ID: <f790ae42-2678-78c5-bcb1-084c17b79136@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/07/2019 20:22, Atharva Lele wrote:
> On Thursday, July 4, 2019 11:58:21 AM IST Peter Korsgaard wrote:
[snip]
>> Is there any use case for ever storing these in the rootfs, or should we
>> just do this fix unconditionally?
> 
> Personally, I can't think of a reason why we'd want to store atime/ctime in 
> the rootfs.

 ctime is pretty useless in a tarball because when extracting the ctime will be
set to extraction time anyway (tested with -xpf as root).

 There might be some use for atime, but atime is already set by the "touch"
command that preceeds the tarball creation, so it doesn't make much of a difference.

 So yes, we probably don't need to make this depend on BR2_REPRODUCIBLE.

 Regards,
 Arnout


> I think they got included when we added --xattrs-include='*'
> 
> Arnout, Matt and Yann: any thoughts on that?
> 
