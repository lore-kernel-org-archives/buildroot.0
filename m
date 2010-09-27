From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 27 Sep 2010 08:10:19 +0200
Subject: [Buildroot] auotgen.sh running before ./configure
In-Reply-To: <AANLkTinXKfGsCB8rESiT7iTMMdcrRkJgKUk7hXWD1VpH@mail.gmail.com>
References: <AANLkTinXKfGsCB8rESiT7iTMMdcrRkJgKUk7hXWD1VpH@mail.gmail.com>
Message-ID: <1285567819.27944.77.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lundi 27 septembre 2010 ? 07:36 +0200, Belisko Marek a ?crit :
> Hi,
> 
> I want to add navit package (navigation sw) to buildroot.
> Compilation steps described on navit wiki is:
> 1. run ./autogen.sh
> 2. then ./configure; make ....
> 
> How can I add autogen.sh script running before ./configure?
> It is done automatically?
> 
> Thanks in advance,
> 
> marek
> 

Add the following line to your package's makefile, will run the
autoreconf tool at the top of your package source tree :

 <PKG_NAME>_AUTORECONF = YES

If you really want to run autogen.sh you'll have to add a custom hook on
the <PKG_NAME>_POST_EXTRACT_HOOKS or <PKG_NAME>_POST_PATCH_HOOKS.

Regards,

--
Lionel Landwerlin
