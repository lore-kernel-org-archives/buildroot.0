From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Jul 2014 22:14:15 +0200
Subject: [Buildroot] [PATCH 1/2] perf: Add support for Linux 3.13
In-Reply-To: <87r47lnpam.fsf@dell.be.48ers.dk>
References: <1390914640-18160-1-git-send-email-mjonker@synopsys.com>
 <87r47lnpam.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUNHwn7KX3Y-9+LOFs4zOmXcGLk+0Qw6KT-NXKBQ0Yngg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mischa,

On Sun, Feb 2, 2014 at 11:05 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:
>
>  > The Makefile has been renamed to Makefile.perf; so now we check
>  > both Makefiles to support 3.7 - 3.12 and 3.13 - beyond.
>
>  > Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
>  > ---
>  >  package/perf/perf.mk |    2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/perf/perf.mk b/package/perf/perf.mk
>  > index d7898d0..ffe18bc 100644
>  > --- a/package/perf/perf.mk
>  > +++ b/package/perf/perf.mk
>  > @@ -35,7 +35,7 @@ define PERF_BUILD_CMDS
>  >              exit 1 ; \
>  >      fi
>  >      $(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
>  > -            if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile ; then \
>  > +            if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile $(LINUX_DIR)/tools/perf/Makefile.perf ; then \
>
> Hmm, does that really work? I would expect grep to error out when either
> Makefile or Makefile.perf isn't available.
>
> What about simply checking Makefile* instead?

Care to rebase this patch, and double-check the comment of Peter?
In the mean time, another change to this area was done to support 3.10+ kernels.

Thanks,
Thomas
