From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 13 Jan 2016 15:26:42 +0000
Subject: [Buildroot] [PATCH] procps-ng: remove the remaining busybox
	symlinks
In-Reply-To: <8760yy8r7b.fsf@dell.be.48ers.dk>
References: <1452608581-9742-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160112211220.2b7c24bb@free-electrons.com> <20160112202045.GA3463@free.fr>
 <8760yy8r7b.fsf@dell.be.48ers.dk>
Message-ID: <56966CB2.5030702@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, Thomas, Yann,

On 12/01/16 20:42, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  >> I don't think we're doing it this way for any other package. In
>  >> general, we either:
>  >> 
>  >> * Arrange for the package to install its tools at the same location as
>  >> Busybox installs them.
>  >> 
>  >> * Or add a post-install hook to move the binaries installed by the
>  >> package to where Busybox installs them.
>  >> 
>  >> Peter, Yann ?
> 
>  > Yes, I agree with Thomas. First solution is preferred if possible, of
>  > course, so that we don't have to maintain the list of executables to
>  > move in the post-install hook.
> 
> Agreed. If you need to go for the second option make sure it is only
> done if !BR2_ROOTFS_MERGED_USR.
> 

configuring procps-ng for installing its binaries in /bin and /sbin
(first option suggested by Thomas) mostly works, except for two tools
(pidof and watch) which are installed in /usr/bin and their busybox
counterparts still exist in /bin.

configuring procps-ng for installing its binaries in /bin and /sbin
doesn't mean that all its binaries will end up in /bin and /sbin. Some
of them are still installed in /usr/bin and /usr/sbin.

So, I see three options here:

1 - follow the second suggestion from Thomas (post-install hook to move
the ALL binaries installed by the package to where Busybox installs them)

2 - same thing but only move pidof and watch binaries

3 - remove /bin/pidof and /bin/watch symlinks installed by Busybox

I happy with any of them, so, which one do you prefer?

Regards,

Vincent.
