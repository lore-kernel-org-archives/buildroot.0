From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 17 Dec 2020 14:18:58 +0100
Subject: [Buildroot] Fwd: Less Restrictive attribute error on
 init_module and cleanup_module
In-Reply-To: <CAGshWo20BfGQMhgwQs9L9qFdtDSbHFGi=N33bSC586x1+OJmNA@mail.gmail.com>
References: <CAGshWo14F9x8-OzHXCpep7roX49G9AesBUyC3ppzSTUwAvzmHw@mail.gmail.com>
 <CAGshWo20BfGQMhgwQs9L9qFdtDSbHFGi=N33bSC586x1+OJmNA@mail.gmail.com>
Message-ID: <1871a6ad-4028-1b7b-2877-30edd6d435c4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 17/12/2020 ? 13:32, manu f a ?crit?:
> Hello all, I am Manu from France.
> 
> Actually I try to compile buidroot 2020.8 on ubuntu 20.04LTS for imx6
> target with internal toolchain arm 2019.12
> 
> I got these errrors:
> 
> error: 'init_module' specifies less restrictive attribute than its target
> 'gpu_init': 'cold' [-Werror=missing-attributes]
> 
> I googled and found this problem come from new gcc get new warning but
> warning are treat as error cause -Werror flag on buildroot make files.
> 
> some answer told to force CONFIG_PPC_DISABLE_WERROR in kconfig option

This option is only for powerpc and should be already set by Buildroot since:
https://git.buildroot.net/buildroot/commit/?id=1713c3c344be26ec3bcb02a0a0068f21907ab881

But you are on ARM imx6.

Can you test with KCFLAGS=-Wno-error ?

Best regards,
Romain

> 
> I am sorry I an newby on linux compile and I don"t know how to do that.
> 
> Could somebody could help me on this problem ?
> 
> Regards.
> 
> Manu
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
