From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 11:34:14 +0200
Subject: [Buildroot] [RFC v2] support/misc: Adding Vagrant file for
 provisioning
In-Reply-To: <CAHsRNLj0ogoFvjapJoCix9=7Cv4yv53VeASYG70+_CF2wXrgLQ@mail.gmail.com>
References: <1441919530-5421-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAHsRNLj0ogoFvjapJoCix9=7Cv4yv53VeASYG70+_CF2wXrgLQ@mail.gmail.com>
Message-ID: <20150911113414.5826a5af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gabe, Angelo,

On Thu, 10 Sep 2015 14:56:45 -0700, Gabe Evans wrote:

> > +require 'open-uri'
> > +open("http://git.buildroot.net/buildroot/plain/CHANGES") do |f|
> > +  BUILDROOT_VERSION=f.read.lines.first.split(",")[0]
> > +end
> 
> As it is now, CHANGES will be redownloaded every time a vagrant
> command is issued. Can this be moved into $script so that it's only
> executed once during provisioning? This bit could be written in shell
> with something like:
> 
>     curl -s http://git.buildroot.net/buildroot/plain/CHANGES | head -1
> | awk -F ',' '{print $1}'
> 
> Though, I'm not sure if there's a better way to determine the current
> released Buildroot version.

Does it make sense for this provisioning script to randomly pick-up the
latest Buildroot version? Angelo is selling this provisioning script as
a way for several users to have an identical, reproducible, build
environment. But if it randomly picks up the latest Buildroot version,
it kind of defeats that purpose.

So shouldn't the Buildroot version simply be hardcoded in the script
and/or passed as argument in some way?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
