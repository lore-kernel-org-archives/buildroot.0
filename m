From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Aug 2017 09:39:21 +0200
Subject: [Buildroot] [PATCH] package/xmlstarlet: fix host build
In-Reply-To: <CANLo3Jix+ojJWq6QTRaxxpOMDHBJtkUkiZnAzy6neY95h=OGCA@mail.gmail.com>
References: <20170830224010.15658-1-romain.naour@gmail.com>
 <20170831091419.3d0039cc@windsurf.lan>
 <CANLo3Jix+ojJWq6QTRaxxpOMDHBJtkUkiZnAzy6neY95h=OGCA@mail.gmail.com>
Message-ID: <20170831093921.11448124@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Your e-mail is badly quoted. What happened?

On Thu, 31 Aug 2017 09:25:16 +0200, Romain Naour wrote:

> It would be nice to use LANG=C when building and copy/pasting error
> messages, to avoid French words in the middle :)
> 
> "No such file or directory" looks english to me at 0h40 :p

But "erreur fatale" doesn't look very english, even at 0h40 :-)

> I had the issue locally, I think libxml-dev is installed on autobuilders.
> I was trying to reproduce the kodi build issue with glibc 2.26.

I'd be good to understand a little bit better what's happening. My
autobuilder definitely doesn't have libxml-dev installed:

$ dpkg -l | grep libxml
ii  libxml2:amd64                   2.8.0+dfsg1-7+wheezy8            amd64        GNOME XML library

I think it could actually be the opposite: you have libxml-dev
installed locally, and therefore the system-wide libxml installation
gets picked up, instead of the libxml built by Buildroot in
$(HOST_DIR). Could you verify this by checking if you have libxml-dev
installed on your system, reproducing the issue, then see what happens
when you uninstall libxml-dev ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
