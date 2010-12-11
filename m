From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 23:55:29 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/toolchain-improvements
In-Reply-To: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 10:25:27 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5dnly1q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a set of patches that mainly improves the toolchain
 Thomas> configuration and support, with two majors directions :

 Thomas>  * Turn BR2_LARGEFILE, BR2_INET_RPC, BR2_INET_RPC and similar options
 Thomas>    into hidden options, and let the toolchain backends present them as
 Thomas>    they wish. For example for RPC, xthe Buildroot backend says "Do you
 Thomas>    want RPC ?" while the external toolchain backend doesn't show the
 Thomas>    option when glibc is used, or present an option "Does your
 Thomas>    toolchain has RPC ?" when uclibc is used.

 Thomas>    So really those options should now be called
 Thomas>    BR2_TOOLCHAIN_HAS_LARGEFILE, BR2_TOOLCHAIN_HAS_INET_RPC, etc, but
 Thomas>    we kept the old names in this patch series because changing them
 Thomas>    impacts all packages. This will be done later.

 Thomas>    A first commit handles largefile, rpc, ipv6, locale and program
 Thomas>    invocation options, and some later commits handle the C++ option
 Thomas>    and thread options.

 Thomas>  * Extend external toolchain with "profiles", i.e well-known external
 Thomas>    toolchains. For those toolchains, Buildroot can automatically
 Thomas>    download and install them and will automatically select the
 Thomas>    appropriate configuration options (C library used, RPC, IPv6,
 Thomas>    locale, etc.). So an user can know tell Buildroot to use a
 Thomas>    CodeSourcery toolchain, and Buildroot will do all the job. Such
 Thomas>    toolchains are extracted in $(O)/external-toolchain, but my intent
 Thomas>    is to move it to $(O)/toolchain once Gustavoz's toolchain cleanup
 Thomas>    work is done.

 Thomas>    This work keeps the ability of doing some more manual things with
 Thomas>    external toolchains:

 Thomas>      - For an external toolchain profile, you can tell Buildroot *not*
 Thomas>        to download it, and in that case, you must provide Buildroot
 Thomas>        with the location of the external toolchain.

 Thomas>      - You keep the ability to specify a custom profile, where you
 Thomas>        will have to tell Buildroot everything: location of the
 Thomas>        toolchain, toolchain prefix, C library used, etc.

 Thomas> In my opinion, those two directions really make the external
 Thomas> toolchains easier and simpler to use. One topic left is the gdb
 Thomas> options, but I decided not to change it, in order to not conflict too
 Thomas> much with Gustavoz's work.

Thanks, looks good. Care to fix the few issues I pointed out and send a
new pull request? Then I'll pull it.

-- 
Bye, Peter Korsgaard
