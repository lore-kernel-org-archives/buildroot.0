From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 28 Feb 2014 10:53:19 +0800
Subject: [Buildroot] [RFC,
 PATCH 3/8] package/ncurses: Allow building wide char support
In-Reply-To: <20140130204403.5935a48b@skate>
References: <1389862338.917573.283530987294.0.gpush@pablo>	<1389862338.918565.412332853863.3.gpush@pablo>
 <20140130204403.5935a48b@skate>
Message-ID: <530FFA1F.8030805@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>> +	bool "enable wide char support"
>> +	depends on BR2_PACKAGE_NCURSES
> 
> dependency not needed since you're inside a if BR2_PACKAGE_NCURSES.
> 
> I believe this option most likely depends on BR2_USE_WCHAR.
> 
> Also, maybe name the option BR2_PACKAGE_NCURSES_WCHAR, to match the
> BR2_USE_WCHAR name we're already using in Buildroot to talk about wide
> char support.

OK, makes sense, fixed.

> Pffiou, that's a lot of things. Maybe we could refactor this a little
> with the target installation to do something a bit smarter like:
> 
> NCURSES_LIBS-y += libncurses
> NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += libmenu
> NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += libpanel
> NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += libform
> 
> and then use $(NCURSES_LIBS-y) and some loops in target installation
> and in a staging post installation hook to create the appropriate
> symbolic links.

That looks much better. I'll split this change into two stages: one to
implement NCURSES_LIBS-y, and one to add BR2_PACKAGE_NCURSES_WCHAR.

Cheers,


jeremy
