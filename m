From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jun 2018 09:24:07 +0200
Subject: [Buildroot] [PATCH 2/4] support/docker: sort the list of
 installed packages
In-Reply-To: <5b136cda73b5f_208c3fee3611587852799@ultri5.mail>
References: <ed5028f2849286aef3ec10937f4fe7d03a2137b8.1527977964.git.yann.morin.1998@free.fr>
 <5b136cda73b5f_208c3fee3611587852799@ultri5.mail>
Message-ID: <20180603072407.GB23330@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-06-03 01:21 -0300, Ricardo Martincoski spake thusly:
> On Sat, Jun 02, 2018 at 07:19 PM, Yann E. MORIN wrote:
> >  RUN apt-get install -y --no-install-recommends \
> > -        build-essential cmake libc6:i386 g++-multilib \
> > -        bc ca-certificates file locales rsync \
> > -        cvs bzr git mercurial subversion wget \
> > -        cpio unzip \
> > +        bc \
> > +        build-essential \
> > +        bzr \
> > +        ca-certificates \
> > +        cpio \
> > +        cvs \
> > +        file \
> > +        g++-multilib \
> > +        git \
> > +        libc6:i386 \
> >          libncurses5-dev \
> > -        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
> > -        python-pip && \
> 
> With only patches 1 and 2 applied the 'docker build' command will fail:
> /usr/bin/python: No module named pip

Oooh dang... I missed that one when doing the interactive git-add...

> This removal should be part of patch 4.

Obviously so, yes.

> > +        locales \
> > +        mercurial \
> > +        python-nose2 \
> > +        python-pexpect \
> > +        qemu-system-arm \
> > +        qemu-system-x86 \
> > +        rsync \
> > +        subversion \
> > +        unzip \
> > +        wget \
> > +        && \
> 
> We usually don't put && in a separate line.
> I am not really against it if no one else complains.

Well, I'm not too sure either. We have two coflicting rules here:

  - one package per-line, so that we can add/remove packages without
    touching the existing lines, so if we were top add a package after
    the last one, we'd have to touch two lines,

  - we almost exclusively put the && at the end of a line...

Note that the docker best practices put the && at the beginning of the
line when they need to split lines.

So, I don't care what rule we apply (as I prefer neither, as I favour
the one in the docker best practices).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
