From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 Sep 2018 22:43:08 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix static build with openssl
In-Reply-To: <c7ee69a4-ece1-2161-f0a4-d0bbb5dc14ad@micronovasrl.com>
References: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
 <20180909141612.43915a59@windsurf.home>
 <CAPi7W81tAT9=LeVBT6gCR7a57S72ynpganrm4rSLq5viv4oUqw@mail.gmail.com>
 <20180909150919.546beda4@windsurf.home>
 <c7ee69a4-ece1-2161-f0a4-d0bbb5dc14ad@micronovasrl.com>
Message-ID: <CAPi7W8189A500rgXkfiG5GYMAKG916WZHuXknhL5C+mjrvynAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Giulio,

Le lun. 17 sept. 2018 ? 22:37, Giulio Benetti <
giulio.benetti@micronovasrl.com> a ?crit :

> Hello Fabrice, all,
>
> Il 09/09/2018 15:09, Thomas Petazzoni ha scritto:
> > Hello,
> >
> > On Sun, 9 Sep 2018 14:43:41 +0200, Fabrice Fontaine wrote:
> >
> >> Because the last time I tried to use pkg-config, the upstream project
> >> decided to refuse the merge request and use ac_search_libs instead:
> >> https://gitlab.com/muttmua/mutt/merge_requests/25 :-(
> >
> > I think in such cases, we should propose a patch that uses pkg-config
> > if available, and if not falls back to AC_CHECK_LIB or other macros. If
> > pkg-config is available, then static linking will work, if not, it will
> > continue to fail like it used to.
> >
> >> I know that netsnmp is already using pkg-config, but only for libnl
> perhaps
> >> they would agree to use it also for ssl. I'll ask them and if they agree
> >> I'll update my patch.
> >
> > Sure. Thanks!
> >
> > Thomas
> >
>
> During this day I've submit a patch to net-snmp upstream,
> then they've corrected it.
> After they committed another patch.
> And now I'm waiting for Merge Request to be accepted to fix this bug.
>
> It was a mixture of problem:
> - lack of -lssl in checking during configure(mainly DTLS support)
> - lack of -lz in checking during configure for a bunch of functions
>
> I'm going to take over and send BR patch I've done in-reply-to this.
>
OK, thanks for taking over :-)

>
> Best regards
> --
> Giulio Benetti
> CTO
>
> MICRONOVA SRL
> Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
> Tel. 049/8931563 - Fax 049/8931346
> Cod.Fiscale - P.IVA 02663420285
> Capitale Sociale ? 26.000 i.v.
> Iscritta al Reg. Imprese di Padova N. 02663420285
> Numero R.E.A. 258642
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180917/43147111/attachment.html>
