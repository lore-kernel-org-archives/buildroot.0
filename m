From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Oct 2017 07:51:56 +0200
Subject: [Buildroot] [PATCH 1/2] openntpd: fix musl build with older
	kernel headers
In-Reply-To: <20171006043515.chpkvp4z2vpmd2bu@tarshish> (Baruch Siach's
 message of "Fri, 6 Oct 2017 07:35:15 +0300")
References: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
 <871smhic23.fsf@dell.be.48ers.dk>
 <20171006043515.chpkvp4z2vpmd2bu@tarshish>
Message-ID: <87y3oog6wz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> FYI, I believe upstream openntpd development only supports openbsd,
 >> similar to E.G. openssh, and the linux specific code is in
 >> openntpd-portable:
 >> 
 >> https://github.com/openntpd-portable/openntpd-portable

 > The getentropy_linux.c file is not in the openntpd-portable git repo:

 >   https://github.com/openntpd-portable/openntpd-portable/tree/master/compat

Sorry - You're right, I must have been tired yesterday evening.

 > It is apparently copied when generating the tarball from the code openbsd 
 > libressl:

>   https://github.com/libressl-portable/openbsd/blob/master/src/lib/libcrypto/arc4random/getentropy_linux.c

What a mess :/

 > The same goes for libressl-portable, the target of the second patch in this 
 > series. For that reason the upstream pull request is against the openbsd tree, 
 > the real upstream for that file.

Ok, thanks.

-- 
Bye, Peter Korsgaard
