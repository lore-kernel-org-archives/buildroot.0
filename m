From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 13:10:36 +0200
Subject: [Buildroot] [PATCH RFC 1/1] package/libpthsem: cannot be sanely
 cross-compiled
In-Reply-To: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
References: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150819131036.6a2ec1a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Thu, 30 Jul 2015 20:45:30 +0100, Brendan Heading wrote:
> Fixes the following :
> http://autobuild.buildroot.net/results/675df26d7b47e02bad0b22f3e1cb404076a84a91/
> http://autobuild.buildroot.net/results/003c4313676cc79c72a9296159ff63dce177f079/
> http://autobuild.buildroot.net/results/86bd9fd83278a5468856f4abf700df57749d8e09/
> http://autobuild.buildroot.net/results/97205d8fce8d0851208d167fc3fc7ccce40d391a/
> http://autobuild.buildroot.net/results/1764c8f7f84fc5bad950fdb41ecadff571ceb36b/
> http://autobuild.buildroot.net/results/e733cb648398df7efd7ccae6493af3c92713a9bd/
> 
> I'm submitting this as RFC as it seems strange that I've come across this
> only now, but I don't see how libpthsem ever cross compiled in its current
> form.
> 
> During the configure stage, libpthsem attempts to compile and run an
> executable to detect capabilities such as which direction the stack grows,
> behaviour of setjmp, etc. Obviously these fail to execute on non-Intel
> architectures, leading to defaults which cause the build to fail even
> on architectures where libpthsem is supposed to work.
> 
> I've tested mipsel, sparcv8 and aarch64 here but I expect it will fail
> for all the other non-Intel architectures too.
> 
> There are flags to force some (but not all) of these settings to certain
> fallbacks. It's not clear, without access to each of these architectures,
> what the correct default fallback settings should be.
> 
> This patch therefore disables libpthsem and its dependents on non-Intel
> architectures.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

I don't think this is the right solution, as Yann noted. I've posted a
different patch, which is shorter and allows libpthsem to be built on
all architectures, after doing a more in-depth analysis of the
build problem.

See:

  http://patchwork.ozlabs.org/patch/508707/

Consequently, I've marked your patch as Rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
