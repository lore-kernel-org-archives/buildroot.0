From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 18 Jan 2018 23:41:58 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20180118090319.3d32c593@windsurf.lan>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228172129.3dd0acdc@windsurf.home>
 <20171228175256.GA24806@ned> <20171228223629.0fd45695@windsurf>
 <20180118074850.GA10580@itchy>
 <20180118090319.3d32c593@windsurf.lan>
Message-ID: <20180118224158.GA24327@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2018-01-18 09:03, Thomas Petazzoni wrote:
> Hello Eric,
>
> On Thu, 18 Jan 2018 08:48:50 +0100, Eric Le Bihan wrote:
>
> > I see br-aarch64-glibc-2017.05-1078-g95b1dae.tar.bz2, but there is no
> > support for Aarch64 in testing
>
> I'm not sure what you mean by "no support for AArch64 in testing". The
> testing infrastructure can test any arbitrary configuration, so there
> is nothing like "support for architecture <foo> in testing". Perhaps
> you are confused by BASIC_TOOLCHAIN_CONFIG being an ARM toolchain
> configuration. But this BASIC_TOOLCHAIN_CONFIG is not mandatory, it is
> just one toolchain configuration that you can use if your test doesn't
> really care about the architecture/toolchain.
>
> We have tests like support/testing/tests/fs/test_iso9660.py that don't
> use BASIC_TOOLCHAIN_CONFIG.
>

Looking at the existing tests, I thought it was a requirement to use
toolchains hosted at http://autobuild.buildroot.org/.

> > and no artefacts are available.
>
> I'm not sure what "artefacts" you are looking for here.

I was referring to ARTIFACTS_URL, where ARM versatile/vexpress
kernels are available. As I thought I should have used
br-aarch64-glibc-2017.05-1078-g95b1dae.tar.bz2 to get a glibc-based
toolchain, adding Aarch64 support to the emulator seemed necessary.

I'll go with the Linaro toolchain, using ARM vexpress as target.

Thanks for the clarification.

Regards,

--
ELB
