From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:42:48 +0100
Subject: [Buildroot] [PATCH] procps-ng: remove the remaining busybox
	symlinks
In-Reply-To: <20160112202045.GA3463@free.fr> (Yann E. MORIN's message of "Tue, 
 12 Jan 2016 21:20:45 +0100")
References: <1452608581-9742-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160112211220.2b7c24bb@free-electrons.com>
 <20160112202045.GA3463@free.fr>
Message-ID: <8760yy8r7b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> I don't think we're doing it this way for any other package. In
 >> general, we either:
 >> 
 >> * Arrange for the package to install its tools at the same location as
 >> Busybox installs them.
 >> 
 >> * Or add a post-install hook to move the binaries installed by the
 >> package to where Busybox installs them.
 >> 
 >> Peter, Yann ?

 > Yes, I agree with Thomas. First solution is preferred if possible, of
 > course, so that we don't have to maintain the list of executables to
 > move in the post-install hook.

Agreed. If you need to go for the second option make sure it is only
done if !BR2_ROOTFS_MERGED_USR.

-- 
Venlig hilsen,
Peter Korsgaard 
