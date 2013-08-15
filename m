From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Aug 2013 17:11:55 +0200
Subject: [Buildroot] Fwd:  [PATCH 1/1] ola: new package
In-Reply-To: <CALy4uEWtQiLAfbe8VRQ1iJX1TQxbZ=HSTXN+De7DKumsH2sWrA@mail.gmail.com>
References: <1376330715-20047-1-git-send-email-blanco.ether@gmail.com>
 <20130814003211.0c9bdaa7@skate>
 <30D3ECD4-98BF-4A89-A156-5A5D2A7EE1AB@gmail.com>
 <CALy4uEU8nED=gPosezp_5dK79BQ8Q18ZtogJhPComrO+kHkJZA@mail.gmail.com>
 <CALy4uEWtQiLAfbe8VRQ1iJX1TQxbZ=HSTXN+De7DKumsH2sWrA@mail.gmail.com>
Message-ID: <20130815171155.6d9be3c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Skok,

On Thu, 15 Aug 2013 10:30:12 -0400, David Skok wrote:

> I checked with maintainer and karate and spi plugins build by mistake even
> with --disable to configure.  Will have to either live with that or take
> selection out and user assumes that it will be built.

Ok, then for now, remove the options for those plugins that are always
built, and only add options for plugins that can actually be
disabled/enabled.

>  The milinst plugin
> is new and I added it to the list as well as ordered all alphabetically.
>  Also found error with a plug in requiring python dependency in original
> patch and added python binding dependency comment for said plugin.
> 
> A general buildroot question...
> When plugin selections added after first build, ./configure is not re-run.
>  As such dependencies are built but not new plugins.  Is there something I
> need to put in package patch to make this work?

No, because we don't try to make this work. When an user changes the
Buildroot configuration, he has either to rebuild everything, or to
know what are the impacts of the configuration change and rebuild the
corresponding packages.

The problem is that it is almost impossible to know what is the impact
of an arbitrary change in the configuration, so we don't try to handle
this, it's part of the KISS principle.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
