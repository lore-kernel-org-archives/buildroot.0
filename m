From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Sep 2015 00:34:14 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87k2rrvqlh.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk>
 <20150915114159.758baca9@free-electrons.com>
 <87k2rrvqlh.fsf@dell.be.48ers.dk>
Message-ID: <55F89CE6.4070004@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Peter Korsgaard wrote:
>   >> But I still need to be convinced that adding this other mdev variant is
>   >> the best tradeoff between:
>   >>
>   >> - Adding the patches
>   >>
>   >> - Ask people to backport devtmpfs to their kernel
>   >>
>   >> - Ask people to handle it in a post-build script
>   >>
>   >> - Ask people to add a initramfs mounting a tmpfs on /dev + mknod before
>   >> executing init
>   >>
>   >> - Asking people to stick with user space of the same "maturity" ;) as
>   >> their kernel
>
> Or alternatively, extend the S10mdev logic to detect that it need to
> create a tmpfs on /dev (by looking for devtmpfs in /proc/filesystems or
> detecting that /dev is RO) and have all the fixup there. That way it
> atleast doesn't add any more complications to the rest of Buildroot /
> users.

Indeed another interesting option. I'll consider it, thanks.

-- 
Luca
