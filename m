From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 11:03:38 +0200
Subject: [Buildroot] how to install package ltp-testsuite outside of
	target directory
In-Reply-To: <8729016553E3654398EA69218DA29EEF15B9ADF2@cnshjmbx02> (YUAN
 Linyu's message of "Wed, 17 May 2017 08:48:08 +0000")
References: <8729016553E3654398EA69218DA29EEF15B99E23@cnshjmbx02>
 <8760gz7u5a.fsf@dell.be.48ers.dk>
 <8729016553E3654398EA69218DA29EEF15B9ADF2@cnshjmbx02>
Message-ID: <87shk36ej9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "YUAN" == YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn> writes:

Hi,

 >> An alternative is to write a post-build script to remove these files
 >> from the rootfs and instead create a seperate filesystem with the ltp
 >> files.
 > Do you mean private post-build script, right? 

Yes, a custom script.

 > So buildroot will not provide an official solution to do such thing,
 > right?

The single rootfs assumption is quite deep in Buildroot and I haven't
seen a design for how we could cleanly handle various rootfs splitups
without introducing a lot of complexity, so don't expect Buildroot to
officially support it in the near future.

-- 
Bye, Peter Korsgaard
