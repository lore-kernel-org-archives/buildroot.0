From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 09:04:29 +0200
Subject: [Buildroot] Suggestion for config menu help for path values
In-Reply-To: <hvr8t1$io0$1@dough.gmane.org>
References: <hvr8t1$io0$1@dough.gmane.org>
Message-ID: <20100623090429.539f3c0f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Jun 2010 21:10:57 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> Just a suggestion for anytime somebody is working on the config menu
> help for an option that allows a path to be entered: always specify in
> the item's help whether an absolute path is required, and if not,
> where the starting point is for a relative path.
> 
> For several different options, it's taken me many guesses to figure
> out from what working direction a relative path should be referenced.
> When each guess requires a build from-scratch, you can spend hours
> trying to figure out what path value to enter for a particular script
> or config file.
> 
> Right now I'm trying to figure out the CWD when the post-build script
> is called, and I'll submit a help patch when I figure out the answer.

All Buildroot Makefiles are interpreted from the top Buildroot source
directory, as we only use Makefile inclusion and not recursive make.
So, in general, relative paths are interpreted relatively to the top
Buildroot source directory.

> Another source of confusion I've run into a few times are cases where
> the title for a config item doesn't match up with either the config
> variable name or the phrase commonly used elsewhere to refer to that
> item.  For example, it takes a bit if digging to figure out that in
> the config menus, what the documentation calls the "post-build
> script", who's value is "BR2_ROOTFS_POST_BUILD_SCRIPT" is titled
> "Custom script to run before packing files".

Don't hesitate to point us those inconsistencies, and either submit a
patch to fix them or ask us to do so :-)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
