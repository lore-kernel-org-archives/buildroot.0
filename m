From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 21:19:43 +0100
Subject: [Buildroot] [PATCH 06/10] libcuefile: new package
In-Reply-To: <4D3830B0.2020708@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 20 Jan 2011 09:55:12 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-7-git-send-email-gustavo@zacarias.com.ar>
	<87pqrrbv5b.fsf@macbook.be.48ers.dk>
	<4D3830B0.2020708@zacarias.com.ar>
Message-ID: <87vd1j9vkw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> I don't know anything about cmake. Do you have any idea how to fix
 >> this?  Disable ccache for this build for now?

 Gustavo> *SIGH*
 Gustavo> That's the reason i wrote "oh no, cmake" on IRC.

:/

 Gustavo> Does cdrkit fail too with ccache? (the other cmake package)

Just tried, and it does:

CMake Error: your C compiler: "/home/peko/source/buildroot/output2/host/usr/bin/ccache /home/peko/source/buildroot/output2/host/usr/bin/powerpc-unknown-linux-uclibc-gcc" was not found.   Please set CMAKE_C_COMPILER to a valid compiler path or name.

 Gustavo> If there's an easy way to skip ccache for this package only
 Gustavo> i'm all for it until we get cmake infra sorted out.

Presumably we just need to use TARGET_CC_NOCCACHE?
A quick test with cdrkit seems to confirm it.

-- 
Bye, Peter Korsgaard
