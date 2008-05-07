From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 7 May 2008 12:09:54 +1000
Subject: [Buildroot] Anyone know why Buildroot complains about
	uClibc	RPC for NFS support?
In-Reply-To: <326f33790805061757l56e09784x5021e51f919479b5@mail.gmail.com>
References: <326f33790805061757l56e09784x5021e51f919479b5@mail.gmail.com>
Message-ID: <20080507020954.GA28208@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 06, 2008 at 05:57:45PM -0700, Arun Reddy wrote:
> #error "*You* *need to build uClibc with UCLIBC_HAS_RPC* for NFS support."
> 
> http://img254.imageshack.us/img254/8638/rpcproblemka7.jpg
> 
> I am not understanding this error, because I never wanted support for NFS in
> the first place. (I just want to build something that will run in QEMU).
> Does anyone know why I get this error and why it complains about NFS support
> even though I disabled it in the kernel?

The kernel doesn't use uClibc, and disabling NFS in the kernel isn't
enough. Maybe you have the NFS utilities package enabled, and/or NFS mount
support in busybox?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
