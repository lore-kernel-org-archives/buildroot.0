From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 15 Oct 2015 16:06:39 +0200
Subject: [Buildroot] ltp-testsuite without native RPC (commit
	8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d)
Message-ID: <CAAXf6LUBj47OW0+VBzeYE-Zh3jLMg77-kWCOiSCMPGiRKKSPfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, all,

I only now saw your commit 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d
that disables again building ltp-testsuite without a native-RPC
toolchain. Using commit baedef979cda7783b399099b49cd23536e44b1c7 I had
added that support.

First of all, it looks to me that the patch is incomplete: the
Config.in file still allows selecting ltp-testsuite without RPC
support, and selects libtirpc in that case. While I haven't tried it
again, I think this will break compilation for these cases.

But more to the core of the problem: I wonder if disabling the entire
ltp-testsuite here is the right approach. The RPC support is only
needed for the small amount of network tests that use RPC. The ltp
testsuite as a whole is much broader than that. By disabling
ltp-testsuite entirely the users without native rpc toolchain are thus
'punished' unnecessarily hard.

What about patching ltp-testsuite instead, not enabling the RPC tests
in this case? At first sight this was added with following (ltp)
commit:
https://github.com/linux-test-project/ltp/commit/8e9a4dbb8eaa561e51d6d8ebe5a5342f3e498224

Thanks,
Thomas
