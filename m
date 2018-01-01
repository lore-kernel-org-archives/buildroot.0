From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 1 Jan 2018 04:05:48 -0800
Subject: [Buildroot] [PATCH 1/1] gconf: new package
In-Reply-To: <20180101123414.49e3b498@windsurf>
References: <20171121020258.31523-1-joseph.kogut@gmail.com>
 <20180101123414.49e3b498@windsurf>
Message-ID: <CAMWSM7gD6i+EbD0-Fwfy00a_ZuVsBv8PimYbexA5ptjGQshAcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Jan 1, 2018 3:34 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Mon, 20 Nov 2017 18:02:58 -0800, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/gconf/Config.in  | 10 ++++++++++
>  package/gconf/gconf.hash |  4 ++++
>  package/gconf/gconf.mk   | 10 ++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/gconf/Config.in
>  create mode 100644 package/gconf/gconf.hash
>  create mode 100644 package/gconf/gconf.mk

Thanks for your contribution. I've applied, after fixing a number of
issues:

    [Thomas:
     - propagate dependencies of selected packages in Config.in
     - add missing Config.in comment about dependencies
     - add missing upstream URL in Config.in
     - add missing comment header in .mk file
     - remove --disable-nls from configuration options, it is taken care
       of by the package infrastructure
     - remove --disable-dependency-tracking, it is taken care of in the
       package infrastructure
     - add $(TARGET_NLS_DEPENDENCIES) to <pkg>_DEPENDENCIES, since gconf
       has optional NLS support
     - add host-intltool to <pkg>_DEPENDENCIES, since gconf needs
       intltool-update
     - fix license: it's LGPL-2.0+, not GPL-2.0.]

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com


Thanks, Thomas! I meant to fix this one, but I've been busy with other work.

Best,

Joseph
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180101/350dec74/attachment.html>
