From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 22:10:20 +0100
Subject: [Buildroot] [PATCH] new variable <pkg>_CONFIG_FIXUP
In-Reply-To: <50EC8759.7010505@mind.be>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130107231037.39a798cf@skate> <50EB4AE5.7070407@petroprogram.com>
 <20130107234206.1487aa87@skate> <50EC8759.7010505@mind.be>
Message-ID: <20130108221020.6ed6f7ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 08 Jan 2013 21:53:45 +0100, Arnout Vandecappelle wrote:

> > Like (untested):
> >
> > 	if test -n $($(PKG)_CONFIG_FIXUP) ; then \
> > 		$(call MESSAGE, "Blabla") ; \
> > 		for file in ...
> > 			...
> > 		done
> > 	fi
> 
>   The test isn't necessary, the loop will not execute if it is empty.

See the original discussion. The test is necessary to not show the
message "Fixing package configuration files" if there are no files to
fix, i.e if the <PKG>_CONFIG_FIXUP variable is empty.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
