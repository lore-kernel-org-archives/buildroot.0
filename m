From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 20:51:54 +0200
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20131001205154.059ec4af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Fri, 27 Sep 2013 09:43:35 -0500, Clayton Shotwell wrote:

> Adding a check to remove a downloaded package if the version is HEAD. This causes the 
> package to be re-downloaded with updated software. This feature is very
> useful during package development.

I haven't made up my mind yet on this, but in general, I'd like to
avoid having several "mechanisms" achieving the same goal. I believe
the <pkg>_OVERRIDE_SRCDIR mechanism is already here to easily allow to
rebuild the latest version of a component source code during its
development.

It seems like the mechanism you're proposing overlaps quite
significantly with that, while being a bit less flexible. Have you
tried the <pkg>_OVERRIDE_SRCDIR mechanism?

Regarding the implementation, I'm not sure to understand how
<pkg>_VERSION = HEAD is supposed to be used. For example, I have a
software, whose source code is handled in Git, in its 'master' branch.
How would I tell your mechanism that I want the latest source code to
be redownloaded each time?

Moreover, it's going to be redownloaded each time completely, which is
quite annoying during development. The <pkg>_OVERRIDE_SRCDIR allows you
to point to a local directory, which avoids re-downloading the entire
source code everytime.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
