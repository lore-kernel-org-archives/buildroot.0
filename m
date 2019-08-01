From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 1 Aug 2019 16:24:20 +0200
Subject: [Buildroot] [PATCH v2] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <CANQCQpbTPuhm_a-SFei+RNdkRvPjXP5LZddPYqvAjoXTgTqD7g@mail.gmail.com>
References: <20190731193119.10522-1-petr.vorel@gmail.com>
 <CANQCQpbTPuhm_a-SFei+RNdkRvPjXP5LZddPYqvAjoXTgTqD7g@mail.gmail.com>
Message-ID: <20190801142419.GA30389@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

> > +++ b/package/ima-evm-utils/Config.in
> > @@ -0,0 +1,11 @@
> > +config BR2_PACKAGE_IMA_EVM_UTILS
> > +       bool "ima-evm-utils"
> > +       depends on BR2_USE_MMU # keyutils dependency: fork()
> > +       depends on !BR2_STATIC_LIBS # keyutils dependency: dlopen
> > +       select BR2_PACKAGE_OPENSSL
> > +       select BR2_PACKAGE_KEYUTILS
> > +       help
> > +         Linux Integrity Measurement Architecture (IMA)
> > +         Extended Verification Module (EVM) tools.

> Do you have a proposal for how to use these tools in an embedded
> environment where a filesystem needs to be "labeled/staged" offline
> with the signatures/hashes?

> The filesystem staging might be a good run time test case as well to
> show the end to end use where you execute a qemu which uses the IMA
> tools to authenticate apps executing from a filesystem you just built.

Yes I was thinking about it as well. While for some usage it's handy to have it
on the target, it'd be certainly helpful to offer functionality to do do
labelling filesystem with security.{ima,evm} extended attributes or with digital
signatures during stagging.

Kind regards,
Petr
