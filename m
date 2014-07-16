From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 19:48:42 +0200
Subject: [Buildroot] [PATCH] exim: get rid of the convert the custom
 config file boolean knob
In-Reply-To: <1405527115-16260-1-git-send-email-luca@lucaceresoli.net>
References: <1405527115-16260-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20140716194842.5cf1aaf3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed, 16 Jul 2014 18:11:55 +0200, Luca Ceresoli wrote:
> The current implementation causes troubles with the autobuilders when they
> set BR2_PACKAGE_EXIM_CUSTOM_CONFIG=y, because in these cases
> BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE is empty, and this is a configuration
> error.
> 
> Solve the problem by entirely reomving the BR2_PACKAGE_EXIM_CUSTOM_CONFIG
> boolean knob. Activation of the custon configuration file is now detected by
> the fact that BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE is non-empty.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/0db/0db54c555f6c7e635ebf99f86b3f91dc31e441f0/

Thanks, applied with minor fixes to the Config.in option description.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
