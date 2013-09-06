From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 10:38:47 +0200
Subject: [Buildroot] [RFCv1 00/11] Convert toolchain backends to
 packages to fix source/external-deps/legal-info
In-Reply-To: <CAHkwnC_8gMrxTO_e8y2qg=NSZV6Bb2Wb+0kP9sEHphKXJuw1NQ@mail.gmail.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHkwnC_8gMrxTO_e8y2qg=NSZV6Bb2Wb+0kP9sEHphKXJuw1NQ@mail.gmail.com>
Message-ID: <20130906103847.662e1463@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 6 Sep 2013 10:28:32 +0200, Fabio Porcedda wrote:

> > In the long term, I'm thinking of:
> >
> >  (1) Making 'toolchain' a dependency of all target packages, because
> >      it's really what it is.
> 
> About that i've already sent a patch "package: add toolchain
> dependency to inner-generic-package:
> http://patchwork.ozlabs.org/patch/237887/
> 
> I will rebase and send the patch after i sent the v3 for the top-level
> parallel make.

Seems right, but it should remove "toolchain" from being pulled in the
main Makefile. If all target packages already depend on it, there's no
longer a reason to have "toolchain" be a special case target handled by
the main Makefile (unless I'm missing something).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
