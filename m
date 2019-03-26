From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 26 Mar 2019 20:24:42 +0100
Subject: [Buildroot] [PATCH v6] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <20190326185319.7ee8509e@windsurf>
References: <20190326131925.31092-1-etienne.carriere@linaro.org>
 <20190326185319.7ee8509e@windsurf>
Message-ID: <CAN5uoS-oUoWCn+H-BwGtwxPYMEKuJdWOLYDpen+K6oL3aeczhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Mar 2019 at 18:53, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
> On Tue, 26 Mar 2019 14:19:25 +0100
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> > Add a patch over current optee-client 3.4.0 to fix build issues
> > reported by some toolchains with traces like:
> >
> >   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
> >   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >     ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
> >                             ^
> >   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_OpenSession?:
> >   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
> >     arg = (struct tee_ioctl_open_session_arg *)buf;
> >           ^
> >   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_InvokeCommand?:
> >   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
> >     arg = (struct tee_ioctl_invoke_arg *)buf;
> >
> > The optee-client patches have been in the OP-TEE project [1] & [2] and
> > will be available in the OP-TEE next release planned 3.5.0.
> >
> > Fixes [3], [4], [5] and other failing builds reported by autobuild tests.
> >
> > [1] https://github.com/OP-TEE/optee_client/pull/146
> > [2] https://github.com/OP-TEE/optee_client/pull/153
>
> These links should have pointed to the commits, not the pull requests,
> since the patches have been merged.

Sorry, i made half the work.
Thank for all the fixes.

regards,
etienne

>
> > +Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > +Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > +Tested-by: Jerome Forissier <jerome.forissier@linaro.org> (HiKey960 32, 64)
> > +Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> I've added here a reference to the upstream commit.
>
> > +
> > +[fix conflict]
> > +Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>
> And here as well.
>
> Applied to master, with those changes. Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
