From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 22:55:13 +0100
Subject: [Buildroot] [PATCH v3 1/1] pkg-autotools: generic configure fix
 for powerpc64
In-Reply-To: <1d653a47bcc91167e4ff1782e889a8229119fc3b.1480309892.git.sam.bobroff@au1.ibm.com>
References: <1d653a47bcc91167e4ff1782e889a8229119fc3b.1480309892.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161205225513.5c2bf373@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 16:11:39 +1100, Sam Bobroff wrote:
> Many (100+) packages supported by buildroot contain old configure
> scripts (or build them from old versions of autotools) that are unable
> to determine how to link shared libraries on powerpc64 and
> powerpc64le. This causes that test to erroneously fail on toolchains
> that are not "bi-endian" (which is the case for toolchains built by
> buildroot), which causes configure to build static libraries instead
> of dynamic ones. Although these builds succeed, they tend to cause
> linker failures in binaries later linked against them.
> 
> Because affected configure files can be discovered automatically, this
> patch introduces a hook (enabled only when building for powerpc64 and
> powerpc64le) that uses a script to scan and fix each package.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
