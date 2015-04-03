From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 16:31:49 +0200
Subject: [Buildroot] [PATCH 1/1] Add package sl
In-Reply-To: <1427879325-12015-1-git-send-email-j.rosenboom@x-ion.de>
References: <1427879325-12015-1-git-send-email-j.rosenboom@x-ion.de>
Message-ID: <20150403163149.42547bc6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jens Rosenboom,

On Wed,  1 Apr 2015 11:08:45 +0200, Jens Rosenboom wrote:
> SL (Steam Locomotive) runs across your terminal when you type "sl" as
> you meant to type "ls". It's just a joke command, and not useful at all.
> 
> Might want to depend on BR2_PACKAGE_NCURSES_WCHAR even in order to get
> terminfo for xterm-256color, but I'm not sure whether that should be
> just optional.
> 
> Signed-off-by: Jens Rosenboom <j.rosenboom@x-ion.de>
> ---
>  package/Config.in    |  1 +
>  package/sl/Config.in |  9 +++++++++
>  package/sl/sl.mk     | 20 ++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/sl/Config.in
>  create mode 100644 package/sl/sl.mk

Thanks, applied, after doing a number of changes:

    [Thomas:
     - Change "depends on BR2_PACKAGE_NCURSES" to "select
       BR2_PACKAGE_NCURSES".
     - Rewrap Config.in help text.
     - Remove comment in help text about the need to check dependencies,
       there's nothing to be done really.
     - Change the license from "Unclear" to "Custom".
     - Use $(TARGET_CONFIGURE_OPTS instead of passing CC and CFLAGS
       explicitly.
     - Pass '-m 0755' when doing the $(INSTALL)
     - Add ncurses to SL_DEPENDENCIES.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
