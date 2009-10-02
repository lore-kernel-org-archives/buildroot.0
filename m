From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 02 Oct 2009 09:13:19 +0200
Subject: [Buildroot] buildroot problem
In-Reply-To: <1D6034426110564DA0DEA9EE9793B38357C834B1C5@NBE-MBX01.americas.swk.pri>
	(Carl Heyendal's message of "Thu\, 1 Oct 2009 17\:58\:09 -0400")
References: <1D6034426110564DA0DEA9EE9793B38357C834B1C5@NBE-MBX01.americas.swk.pri>
Message-ID: <87r5tm6zg0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carl" == Heyendal, Carl <CHeyendal@stanleyworks.com> writes:

Hi,

Please send buildroot questions to the buildroot list
(buildroot at uclibc.org) and not directly to me, thanks.

 Carl> I spotted your name in the patch that failed below. Would you be
 Carl> able to tell me how to fix the problem. I'm pretty much a newbie
 Carl> to Buildroot. (and embedded Linux)
 
 Carl> thanks in advance.
 Carl> /carl h.
 
 Carl> makeinfo installed:      FALSE

 Carl> Most likely some packages will fail to build their documentation
 Carl> Either install 'makeinfo' on your host or fix the respective packages.
 Carl> Makeinfo can usually be found in the texinfo package for your host.
 Carl> Build system dependencies:   Ok

Please install makeinfo, so you won't get into trouble later.

 Carl> rm -rf /home/heyendal/buildroot/output/build/buildroot-config
 Carl> mkdir -p /home/heyendal/buildroot/output/build
 Carl> cp -dpRf package/config/buildroot-config /home/heyendal/buildroot/output/build/
 Carl> buildroot-config
 Carl> toolchain/patch-kernel.sh /home/heyendal/buildroot/output/toolchain/
 Carl> uClibc-0.9.30.1 toolchain/uClibc/ \
 Carl>   uClibc-0.9.30.1-\*.patch \
 Carl>   uClibc-0.9.30.1-\*.patch.arm
 
 Carl> Applying uClibc-0.9.30.1-64bit-strtouq.patch using plaintext:
 Carl> toolchain/patch-kernel.sh: line 52: patch: command not found

You don't have the program 'patch' installed, which is needed by
buildroot - Please install it.

I've updated the dependencies check in git to also check for patch.

 Carl> Patch failed!  Please fix uClibc-0.9.30.1-64bit-strtouq.patch!
 Carl> make: *** [/home/heyendal/buildroot/output/toolchain/uClibc-0.9.30.1/.patched]
 Carl> Error 1

-- 
Bye, Peter Korsgaard
