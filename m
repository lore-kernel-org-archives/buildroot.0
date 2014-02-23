From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 22:33:31 +0100
Subject: [Buildroot] [PATCH 12/13] docs/manual: document the usage of
 <pkg>_OVERRIDE_SRCDIR
In-Reply-To: <87eh2to6v0.fsf@dell.be.48ers.dk>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140223162934.GC32759@free.fr> <87eh2to6v0.fsf@dell.be.48ers.dk>
Message-ID: <20140223213331.GJ32759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-02-23 22:29 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  >> +appropriate solution, because this directory is removed on +make
>  >> +clean+.
>  >> +
>  >> +Therefore, Buildroot provides a specific mechanism for this use case:
>  >> +the +<pkg>_OVERRIDE_SRCDIR+ mechanism. Buildroot reads an _override_
>  >> +file, which allows the user to tell Buildroot the location of the
>  >> +source for certain packages. By default this _override_ file is named
>  >> ++local.mk+ and located in the top directory of the Buildroot source
>  >> +tree,
> 
>  > Wrong, now it is locate in $(CONFIG_DIR), that is, the directory where
>  > we have the .config file, since:
>  >     b1e514d Config: default BR2_PACKAGE_OVERRIDE_FILE to $(CONFIG_DIR)/local.mk
> 
>  > This is Buildroot's top dir when building in-tree, and for out-of-tree
>  > builds, it's in $(O).
> 
> True, but that commit is only in next, and I imho think this series
> belongs on master, so I'll leave it for now.

Right! In fact, I was looking at my tree, which has it. It's eda3d0e on
-next.

And I agree, this series belongs to master. We'll just have to remember
it at merge time.

Sorry for the disruption.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
