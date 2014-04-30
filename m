From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Apr 2014 19:40:48 +0200
Subject: [Buildroot] Patchwork cleanup #8: submitter notification
In-Reply-To: <20140430165659.GA3336@free.fr>
References: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
 <20140429210905.GE3248@free.fr> <20140430005249.2d0f01de@skate>
 <20140430165659.GA3336@free.fr>
Message-ID: <20140430194048.1e070625@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 30 Apr 2014 18:56:59 +0200, Yann E. MORIN wrote:

> > We do a "chown -R 0:0" on all files in the root filesystem, before
> > taking into account device tables. So I don't see how an ownership on
> > the build machine can leak into the generated root filesystem.
> 
> chown does not change the ownership of a symlink, only that of the
> pointed-to entity:
> 
>     $ touch titi
>     $ ln -s titi toto
>     $ sudo chown root:root toto
>     $ ls -l titi toto
>     -rw-r--r-- 1 root   root   0 Apr 30 18:55 titi
>     lrwxrwxrwx 1 ymorin ymorin 4 Apr 30 18:55 toto -> titi
> 
> So the symlink's ownership is not modified.

Should we do a chown -h -R 0:0 then?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
