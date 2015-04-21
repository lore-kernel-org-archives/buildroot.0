From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 15:30:45 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-generic: prepend downloaded patches
 w/ package
In-Reply-To: <CA+-urNTh3ONseXzFEqx3ALLqLJBmpH-RvV1vQu9bHhx-uEQQFQ@mail.gmail.com>
References: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
 <1429462679-4769-2-git-send-email-fhunleth@troodon-software.com>
 <55357904.1080608@mind.be>
 <CA+-urNTh3ONseXzFEqx3ALLqLJBmpH-RvV1vQu9bHhx-uEQQFQ@mail.gmail.com>
Message-ID: <20150421153045.6927584f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue, 21 Apr 2015 09:03:53 -0400, Frank Hunleth wrote:

> I don't like the idea of penalizing _SOURCE and _EXTRA_DOWNLOADS with
> the ugly filenames from _PATCH, so I'm currently in favor of having a
> different strategies. (I've never used _EXTRA_DOWNLOADS, so maybe it's
> more like _PATCH?)

Thinking out loud. We're trying to solve the problem of two packages
downloading files having the same name, and we're struggling to find a
solution by renaming files.

What if we took a different approach, and instead of renaming files,
keep the file named as they are, but store them in subdirectories,
named per-package. I.e, instead of throwing everything in $(DL_DIR), we
create $(DL_DIR)/<package>/ for each package, and we store the
downloads only for this package there. This way, two different packages
can download files named identically, they will simply be stored in
different directories.

There are obviously some implications (organization of files in
BR2_PRIMARY_SITE and on sources.buildroot.net), but isn't this the
easiest solution, after all? Or am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
