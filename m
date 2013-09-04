From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Sep 2013 07:34:34 -0300
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for
	elf2flt
In-Reply-To: <20130904105101.1662e059@skate>
References: <1378282615.12336.1.camel@phoenix> <20130904105101.1662e059@skate>
Message-ID: <52270CBA.1000603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/2013 05:51 AM, Thomas Petazzoni wrote:
> I don't think host-elf2flt should be added at this level of dependency.
> If I understand correctly elf2flt, it interfaces with the linker, so I
> believe making elf2flt a dependency of binutils would probably make a
> bit more sense.

It's already done correctly in the dependency deparment...

HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib

The problem is it's never pulled in when it's necessary - before the
real packages start building, so adding it up as a gcc dep when
BR2_BINFMT_FLAT=y would be appropiate.

Regards.
