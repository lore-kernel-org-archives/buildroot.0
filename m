From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 15:36:01 +0200
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <35AF1D2435E24FA6B1C89344B22D099E@apexjs> (Sagaert Johan's
	message of "Fri\, 17 Apr 2009 10\:33\:52 +0200")
References: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
Message-ID: <877i1j9zcu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> cleaning :
 
 Sagaert> I don't trust the disclean, it most ends op in a mess.

distclean does a rm -rf dl build_<arch> project_build_<arch>/<project>
binaries/<project>, so that's pretty good.

It currently doesn't get rid for toolchain_build_<arch>, but I'll fix
that now.
 
 Sagaert> i am still wondering why they have put dependencies in
 Sagaert> project_build_arm/../ autotools-stamps. instead of in
 Sagaert> build_arm

Because of the project stuff. There's been discussion about getting
rid of that and simply use the external toolchain stuff if you want to
build seperate rootfs'es for similar hw, and I'm seriously considering
doing so.
 
 Sagaert> besides this, there are still othter issues, the libssp.so.0
 Sagaert> gets build but not installed in the target root directory.

Ohh, details please.

-- 
Bye, Peter Korsgaard
