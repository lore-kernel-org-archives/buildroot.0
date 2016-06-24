From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 09:32:05 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <1466753076.30418.15.camel@synopsys.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <4209f432-0fbd-8d44-7194-c99829f66e2e@smile.fr>
 <1466574249.3622.15.camel@synopsys.com>
 <1466753076.30418.15.camel@synopsys.com>
Message-ID: <20160624093205.722fc199@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 07:24:37 +0000, Vlad Zakharov wrote:

> Returning to the problem. Real issue is that build fails when "makeinfo" is missing on build host.
> So a nice and much easier idea is to add "makeinfo" package and make
> binutils and gdb dependent on the "host-makeinfo" package.

I indeed start to think that it's the only reasonable solution. The
only thing I would like to see is this dependency being added only for
binutils/gdb version that want to re-generate their documentation.
Normally, binutils/gdb versions from release tarballs are fine and
don't try to regenerate their documentation.

As I said earlier, I tried to touch the relevant .info files to have
their timestamp to be later than the source files. It worked fine for
one of binutils or gdb (don't remember which one), but wasn't working
for the other one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
