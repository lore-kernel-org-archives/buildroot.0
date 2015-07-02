From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:22:28 +0200
Subject: [Buildroot] [PATCH 2/2] openssl: always build apps
In-Reply-To: <5595A520.6090903@mind.be>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <1434711274-49716-2-git-send-email-benoit@wsystem.com>
 <20150701111411.1dab82cc@free-electrons.com>
 <55950B29.9090200@wsystem.com>
 <20150702120402.4e4e3b9d@free-electrons.com>
 <5595A520.6090903@mind.be>
Message-ID: <20150702232228.0ad1a03b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, 2 Jul 2015 22:54:56 +0200, Arnout Vandecappelle wrote:

> > We generally try to not clutter menuconfig with too many
> > comments/options: we can't make visible in menuconfig every little
> > possible dependency. That's why we use a lot of "automatic optional
> > dependencies": a package automatically uses another package if it is
> > available, without having this dependency visible from a
> > menuconfig/Config.in point of view.
> 
>  We (or at least, I) do like to have such a thing mentioned in the help text,
> however. The help text does not clutter the menus so there is no reason to be
> terse there.

I am perfectly fine with having more details in the Config.in help text.

However, do we really want to explicitly list all automatic optional
dependencies in the Config.in help text? I believe it would definitely
be hard to maintain. So the Config.in help text should probably be
mostly used for things that aren't clearly visible by reading the .mk
file. And automatic optional dependencies are usually pretty explicit
by looking at the .mk file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
