From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 00:08:32 +0100
Subject: [Buildroot] [git commit] package/iproute2: backport patch to
 fix compilation under glibc < 2.18
In-Reply-To: <20190225212703.ACC728E2B8@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 25 Feb 2019 22:25:44 +0100")
References: <20190225212703.ACC728E2B8@busybox.osuosl.org>
Message-ID: <87h8creaa7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a669c0f2f58e47bef4b7c2863cd1ee587befb662
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When compiling iproute2 using a toolchain containing glibc 2.17 and
 > older, it fails due to a missing definition of AF_VSOCK.

We don't really support such old glibc versions since 2017.08. From
CHANGES:

2017.08-rc1, Released August 2nd, 2017

        Toolchain:

        - CodeSourcery toolchains for x86 and SuperH have been
          removed, they were using a too old glibc version
          (2.17). External toolchains with glibc 2.17 or earlier are
          no longer supported.


But OK, the patch is small and already accepted upstream.

-- 
Bye, Peter Korsgaard
