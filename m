From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 22 Feb 2020 21:17:14 +0100
Subject: [Buildroot] [PATCH] infra: don't be verbose when calling the
 instrumentation steps
In-Reply-To: <20200222110541.GE17342@scaer>
References: <20200222103848.10236-1-yann.morin.1998@free.fr>
 <CAAXf6LX6G0c72v8rx1W9maf4ERKffKyo9qsSaN+qdsd=OOG-7g@mail.gmail.com>
 <20200222110541.GE17342@scaer>
Message-ID: <CAAXf6LUDaJ5eKtPCmYOsni0=VYOEF1q8zouwrkvB7Bqrh_ai-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 22 feb. 2020 a las 12:05, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2020-02-22 11:59 +0100, Thomas De Schampheleire spake thusly:
> > On Sat, Feb 22, 2020, 11:38 Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
> >
> >   Commit 509db3b88a added calls to (parts of) the instrumentation steps.
> >   However, those calls are echoed, unlike the other places where we call
> >   them (in the package infra).
> >
> >   Signed-off-by: Yann E. MORIN < [2]yann.morin.1998@free.fr>
> >   Cc: Thomas De Schampheleire < [3]patrickdepinguin@gmail.com>
> >   ---
> >    Makefile | 12 ++++++------
> >    1 file changed, 6 insertions(+), 6 deletions(-)
> >
> >   diff --git a/Makefile b/Makefile
> >   index 9662987bb4..b61a20a354 100644
> >   --- a/Makefile
> >   +++ b/Makefile
> >   @@ -807,12 +807,12 @@ endif # merged /usr
> >    # AFTER ALL FILE-CHANGING ACTIONS:
> >    # Update timestamps in internal file list to fix attribution of files
> >    # to packages on subsequent builds
> >   -       $(call step_pkg_size_file_list,$(TARGET_DIR))
> >   -       $(call step_pkg_size_finalize)
> >   -       $(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
> >   -       $(call step_pkg_size_finalize,-staging)
> >   -       $(call step_pkg_size_file_list,$(HOST_DIR),-host)
> >   -       $(call step_pkg_size_finalize,-host)
> >   +       @$(call step_pkg_size_file_list,$(TARGET_DIR))
> >   +       @$(call step_pkg_size_finalize)
> >   +       @$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
> >   +       @$(call step_pkg_size_finalize,-staging)
> >   +       @$(call step_pkg_size_file_list,$(HOST_DIR),-host)
> >   +       @$(call step_pkg_size_finalize,-host)
> >
> > Perhaps this should rather be $(Q) than @?
>
> We're using @ in all other places where we call the hooks, and this
> patch is just doing the same here. If we want $(Q) here (which I think
> is a good idea), we'd want to *also* change the existing calls to steps
> in the package infra at the same time.
>
> I just want to have a minimalist patch here, that aligns the very recent
> changes to the long-existing code.
>
> > I quite like the fact that you can see what's going on, mostly relevant
> > when investigating an issue...
>
> Yes, I do agree.
>
> Care to send a patch afterwards, that changes the existing code? ;-)

Sure, I can do that.

Best regards,
Thomas
