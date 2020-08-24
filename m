From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 24 Aug 2020 08:47:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build with gcc 9
In-Reply-To: <20200823233337.0540a172@windsurf.home>
References: <20200822202350.2341347-1-fontaine.fabrice@gmail.com>
 <20200823233337.0540a172@windsurf.home>
Message-ID: <CAPi7W81oV8tYUigAp=FUTY36=rEZ_v_njUcaO_bzveOtii4uhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le dim. 23 ao?t 2020 ? 23:33, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Sat, 22 Aug 2020 22:23:50 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > + typedef struct {
> > +-    struct cmsghdr header;
> > +     int            fd;
> > ++    struct cmsghdr header;
>
> Are you sure this fix is correct ?
>
> The cmsghdr structure, as its name suggest, is meant to be the "header
> of a message", and that's why it has this zero-length array at the end,
> to access the payload of the message. I am not sure what the
> consequences are in this specific case, but do you have some
> evidence/explanation that this is correct, beyond "it builds fine" ?
Nope I don't have any evidence so I'll send another patch setting --std=c++11.
I'll also check if the build failure can be reproduced with gcc < 9.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
