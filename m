From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Sep 2014 19:13:58 -0300
Subject: [Buildroot] [PATCHv2 1/4] package/ncurses: Allow building wide
	char support
In-Reply-To: <87r3zca7cc.fsf@dell.be.48ers.dk>
References: <1408543581-15702-1-git-send-email-gustavo@zacarias.com.ar>	<1408543581-15702-2-git-send-email-gustavo@zacarias.com.ar>
 <87r3zca7cc.fsf@dell.be.48ers.dk>
Message-ID: <541764A6.1020804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/15/2014 06:42 PM, Peter Korsgaard wrote:
> You don't seem to add a ncursesw5-config -> ncurses5-config symlink, but
> we explicitly refer to ncurses5-config in several places (and some
> configure scripts probably also expects it):
> 
> package/alsa-utils/alsa-utils.mk:       ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config
> package/dialog/dialog.mk:DIALOG_CONF_OPT += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/ncurses5-config

Hi.
Well to begin with it's not my patch :)
Usually ncurses5 + ncursesw5 configs are used when you need ABI
compatibility which isn't our case (and both libraries built side by side).
According to my tests (allyespackageconfig) other than the packages i've
sent fixes for before/with this set it all works smoothly.
Also packages that don't know about widec support usually don't look for
the non-w variant.

> What's with this extra whitespace? I see it gets fixed up in patch 2,
> but we might as well do it right in patch 1 instead.

As i've said before, not my patch, just fixed the issue.
I went for a followup patch rather than rebase Jeremy's patch in case he
sent a new version, which never happened of course.
Regards.
