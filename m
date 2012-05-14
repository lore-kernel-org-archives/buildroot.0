From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 May 2012 09:58:46 +0200
Subject: [Buildroot] [PATCH] pkg-infra: remove the call from XXXTARGETS
In-Reply-To: <1336857045-10679-1-git-send-email-arnout@mind.be>
References: <1336857045-10679-1-git-send-email-arnout@mind.be>
Message-ID: <20120514095846.7d206d16@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 12 May 2012 23:10:44 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> Replace $(call XXXTARGETS,host) with $(XXXTARGETS_HOST) and
> $(call XXXTARGETS) with $(XXXTARGETS).
> 
> Also includes documentation update, but not for buildroot.html.
> 
> This brings the time for 'make -qp' (which is used by bash-completion)
> down from 1.85s to 1.35s on my laptop.

I haven't tested yet, but I'm fine with the principle. I am just
wondering whether HOST_AUTOTARGETS wouldn't be better than
AUTOTARGETS_HOST for the name of the macro. Or maybe, since we're
renaming everything in this patch it's time to think about a better
name for these macros

 GENPACKAGE / HOST_GENPACKAGE
 GENPKG / HOST_GENPKG
 genpackage / host-genpackage
 genpkg / host-genpkg

 autotoolspackage / host-autotoolspackage
 autotoolspkg / host-autotoolspkg
 cmakepkg / host-cmakepkg
 autotools-package / host-autotools-package
 generic-package / host-generic-package
 autotools-pkg / host-autotools-pkg

Or maybe *TARGETS is just fine, as we have today.

Thoughts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
