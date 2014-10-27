From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 15:47:00 +0100
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKbaAKyGODDjpcCQRnzP__weqk1Jt8fTWnWVVMt7KPJM_Q@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20141011162152.GA4254@free.fr>
 <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
 <5441A0DF.20309@mind.be> <20141018100040.GA3858@free.fr>
 <CAJtjsKYZQabHeU5OwSm5sjfA3dpTg33uhkOX7M1Drv6scAkOTA@mail.gmail.com>
 <CAJtjsKbaAKyGODDjpcCQRnzP__weqk1Jt8fTWnWVVMt7KPJM_Q@mail.gmail.com>
Message-ID: <20141027154700.29de541e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 27 Oct 2014 15:42:48 +0100, Johan Oudinet wrote:

> I (with the help of a colleague) manage to package every ejabberd
> dependency separately. We also had to package rebar because some
> erlang packages rely on it but do not provide it. Therefore, if an
> erlang package includes a rebar script, we use it. Otherwise, we add a
> dependency on host-erlang-rebar and we use this one instead.
> To simplify the task (12 erlang packages), we created a pkg-rebar.mk
> file that provides {host-}rebar-package, similar to pkg-autotools.mk.
> In doing so, we had to factorize the hooks in pkg-autotools.mk.
> 
> I guess the minor modifications of pkg-autotools.mk should be pushed
> in a separate patch.
> Then, should I push the rest of my commits as a big new revision of
> this patch, or should I push each erlang package as a separate patch ?

Each should be a separate patch. Basically, you should send a patch
series, which contains separate patches for the various functionalities
(new package infrastructure, changes to existing package
infrastructure, new packages, etc.). Do not forget to document what you
are doing in the commit logs, especially for the modification to
existing package infrastructures and the new package infra.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
