From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 14:40:09 +0200
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
In-Reply-To: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
References: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
Message-ID: <20131001144009.4117ea4c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  1 Oct 2013 13:38:12 +0200, J?r?me Pouiller wrote:
> systemd-uclibc-fix.patch was applied to systemd to provide execvpe function
> when compiled with uclibc. However, this function is now provided by
> libc-add-non-standard-execvpe-function.patch in uclibc package.
> 
> These two patchs are now in conflict. This commit remove
> systemd/systemd-uclibc-fix.patch.

The thing that worries me is that we start to rely on uClibc features
that are provided by specific patches we have added to our uClibc
package. This means that an user using an uClibc toolchain provided by
Analog Devices for Blackfin, or built with Crosstool-NG will no longer
work properly to build those packages.

I'm not sure what to do about this, though. Mark those packages as
available only with glibc or the internal uClibc toolchain? Stop
backporting uClibc feature patches (like we do for other packages) and
tell people to work with upstream uClibc to get things fixed and
released?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
