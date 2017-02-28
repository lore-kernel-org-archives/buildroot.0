From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 13:57:47 +0100
Subject: [Buildroot] [PATCH] classpath: only allow on supported
 architectures
In-Reply-To: <65126b15-56dc-b768-0e4b-cbec92708e0d@cartelsol.com>
References: <1488233771-5322-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <65126b15-56dc-b768-0e4b-cbec92708e0d@cartelsol.com>
Message-ID: <20170228135747.0e8acb6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 12:13:17 +0100, Marcus Hoffmann wrote:

> > +	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k \
> > +		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
> > +		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le \
> > +		|| BR2_sh || BR2_x86_64  
> 
> I just tested with the test-pkg script and I also get successful sparc
> and sparc64 builds. Any particular reason to not enable it there?

I indeed missed sparc/sparc64 when looking through
native/fdlibm/ieeefp.h, so feel free to send a patch re-enabling
classpath on those architectures.

However, in practice, jamvm doesn't support sparc/sparc64, so you'll be
able to build classpath, but not jamvm, which is not a very useful
result.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
