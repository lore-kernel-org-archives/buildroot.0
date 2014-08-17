From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:27:04 +0200
Subject: [Buildroot] [PATCH 0/4] mpd: Fix config options
In-Reply-To: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
References: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
Message-ID: <20140817212704.477d05b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 11 Aug 2014 13:42:50 +0200, J?rg Krause wrote:
> The config options in mpd.mk for plugin FAAD2 and FLAC are wrong and fixed
> with the first to patches.
> 
> In mpd.mk some plugin options are explicitly enabled and some are explicitly 
> disabled. When building mpd the most plugin options are autoselected if an 
> appropriate library exist in the build system. This may lead to an undesired 
> behaviour if a plugin option is not selected in the Config menu by the user, 
> but mpd will be build with this plugin. The third patch fixes this issue.
> 
> In Config.in is an option for BR2_PACKAGE_MPD_MAD, but in mpd.mk this config
> option is missing. The fourth patch fixes this issue.
> 
> J?rg Krause (4):
>   mpd: Fix config option for plugin FAAD2
>   mpd: Fix config option for plugin FLAC
>   mpd: Set enable/disable config option for all plugins
>   mpd: Add missing config option for plugin MAD

Thanks, I've applied the entire series to the master branch.
Technically speaking, the last patch is not really a fix, but since it
wouldn't have applied to the next branch due to conflicts, and it was
fairly simple, I decided to nonetheless apply to the master branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
