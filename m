From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 6 Nov 2019 17:45:53 -0300
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <168ba3a0-d921-d4d8-7dac-506226ced5fd@mind.be>
References: <20191104124844.8112-1-unixmania@gmail.com>
 <20191104220513.5e8c6269@windsurf.home>
 <168ba3a0-d921-d4d8-7dac-506226ced5fd@mind.be>
Message-ID: <CAJ4jsafLcLMp7qEu19Cb13CRsDAKWimDqMEaaU-2_sPghJyiEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 6, 2019 at 10:12 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 04/11/2019 22:05, Thomas Petazzoni wrote:
> > Hello,
> >
> > Adding our Config.in.legacy expert Arnout.
> >
> > On Mon,  4 Nov 2019 09:48:44 -0300
> > unixmania at gmail.com wrote:
> >
> >> diff --git a/Config.in.legacy b/Config.in.legacy
> >> index fcb10b1291..3336ef85d1 100644
> >> --- a/Config.in.legacy
> >> +++ b/Config.in.legacy
> >> @@ -146,6 +146,22 @@ endif
> >>
> >>  comment "Legacy options removed in 2019.11"
> >>
> >> +config BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
> >> +    bool "BR2_PACKAGE_MODEM_MANAGER_LIBMBIM has been removed"
> >> +    select BR2_LEGACY
> >> +    select BR2_PACKAGE_LIBMBIM
> >> +    help
> >> +      Select BR2_PACKAGE_LIBMBIM to enable support for MBIM protocol
> >> +      in ModemManager
> >> +
> >> +config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
> >> +    bool "BR2_PACKAGE_MODEM_MANAGER_LIBQMI has been removed"
> >> +    select BR2_LEGACY
> >> +    select BR2_PACKAGE_LIBQMI
> >> +    help
> >> +      Select BR2_PACKAGE_LIBQMI to enable support for QMI protocol
> >> +      in ModemManager
> >
> > I think in this specific case, we don't need Config.in.legacy handling.
> > Indeed, a full .config that had BR2_PACKAGE_MODEM_MANAGER_LIBQMI
> > enabled will already have BR2_PACKAGE_LIBQMI, and since the .mk file
> > now relies on BR2_PACKAGE_LIBQMI to enable libqmi support in
> > modem-manager, I think we're good.
> >
> > Of course, that won't work for defconfigs, but I believe updating with
> > a defconfig is not really guaranteed to give the right result. Arnout ?
>
>  In my point of view, indeed it isn't, but this isn't documented anywhere I think.
>
>  So indeed, I agree that no legacy handling is needed here. It will annoy many
> users (because they have to go and disable it in the legacy menu), while being
> of no benefit for most of them.
>
>  Regards,
>  Arnout
>
>
> > Other than that, patch looks good to me. No need to resend, let's just
> > wait to see what Arnout says about the Config.in.legacy handling.
> >
> > Best regards,
> >
> > Thomas
> >

I suggest to apply https://patchwork.ozlabs.org/patch/1186596/ to
solve the build problem, then we can decide if modem-manager and
network-manager need additional changes.

-- 
Carlos Santos <unixmania@gmail.com>
