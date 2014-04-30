From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Apr 2014 18:56:59 +0200
Subject: [Buildroot] Patchwork cleanup #8: submitter notification
In-Reply-To: <20140430005249.2d0f01de@skate>
References: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
 <20140429210905.GE3248@free.fr> <20140430005249.2d0f01de@skate>
Message-ID: <20140430165659.GA3336@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-30 00:52 +0200, Thomas Petazzoni spake thusly:
> On Tue, 29 Apr 2014 23:09:05 +0200, Yann E. MORIN wrote:
> 
> > However, I can se one case where we would want to be able to set
> > ownership and/or permissions on a synlink: to avoid the identity of the
> > "builder" to seep down into the generated filesystem. But even in that
> > case, only the numerical UID would end up in the generated filesystem,
> > so it is not really a concern.
> 
> We do a "chown -R 0:0" on all files in the root filesystem, before
> taking into account device tables. So I don't see how an ownership on
> the build machine can leak into the generated root filesystem.

chown does not change the ownership of a symlink, only that of the
pointed-to entity:

    $ touch titi
    $ ln -s titi toto
    $ sudo chown root:root toto
    $ ls -l titi toto
    -rw-r--r-- 1 root   root   0 Apr 30 18:55 titi
    lrwxrwxrwx 1 ymorin ymorin 4 Apr 30 18:55 toto -> titi

So the symlink's ownership is not modified.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
