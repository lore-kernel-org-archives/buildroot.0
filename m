From: bao bui <buiqbao@gmail.com>
Date: Tue, 15 Mar 2011 04:06:34 -0700
Subject: [Buildroot] buildroot directive for acyion after configuring
In-Reply-To: <20110315111315.5d5a48f5@surf>
References: <AANLkTi=iLXet_5auTP_mp1KzsY9wr=FOQVRNVZk+Q0dg@mail.gmail.com>
	<20110315111315.5d5a48f5@surf>
Message-ID: <AANLkTinUEkDjVg4VnRJPCqvrF-CuGKmPppZCkmSz9gTE@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank Thomas,

After configuring, the Makefile has the EXTRALIBS variable as following

EXTRALIBS= -lcupsimage -lcups -ltiff -ljpeg -lpng -Wl,-Bsymbolic-functions
-lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err -lssl -lcrypto -lz -lpthread -lm
-lcrypt -ldl -lm  -lstdc++  -lfontconfig

I don't have libgssapi_krb5 libkrb5 libk5crypto libcom_err in buildroot
library. I don't know where these option come from, maybe the configure
script probes the host system.

When I try this function in espgs-8.15.4 folder:

grep -r "gssapi" ./

I got nothing. So I don't know how to fix it axcept modify the Makefile
after configuring.
Do you have any idea about this?

Thank you

BAO

On Tue, Mar 15, 2011 at 3:13 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Tue, 15 Mar 2011 02:55:20 -0700
> bao bui <buiqbao@gmail.com> wrote:
>
> > I am cross compiling ghost script. Before the configure process, I
> > can apply my patch by adding the POST_EXTRACT_HOOKS directive as
> > following
> >
> > define ESPGS_PATCH_CROSS_COMPILE
> >     toolchain/patch-kernel.sh $(ESPGS_DIR) package/espgs/ \*.patch
> > endef
> >
> > ESPGS_POST_EXTRACT_HOOKS += ESPGS_PATCH_CROSS_COMPILE
>
> You don't need to do that, the package infrastructure already applies
> the patches named <pkg>-*.patch from the packages/<pkg>/ directory.
>
> > But after configuring, I want to modify the Makefile which is just
> > generated. What directive can I add to the .mk file
>
> You can add a post-configure hook, exactly like the post-extract hook
> you used.
>
> > PS: I can not modify the configure and the Makefile.in in this case
>
> Why ?
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110315/33c5d9ae/attachment-0001.html>
