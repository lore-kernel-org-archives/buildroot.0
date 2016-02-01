From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 19:04:59 +0100
Subject: [Buildroot] [PATCH v2 4/8] vlc: remove dependency on C library
In-Reply-To: <1453929930-18215-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Jan 2016 22:25:26 +0100")
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453929930-18215-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871t8wcnn8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > vlc uses <spawn.h> which was not available in old uClibc
 > versions. However, since we are removing support for uClibc 0.9.33, we
 > can get rid of such dependency. In addition, <spawn.h> is provided by
 > musl, and therefore VLC can be enabled with this C library.

 > Consequently, this commit completely removes any C library dependency
 > for the vlc package. The only special case that needs to be handled is
 > the Blackfin external toolchain from Analog Devices, which still uses
 > an old uClibc version that doesn't provide <spawn.h>.

vlc contains several references to fork(), so it should really just
depend on BR2_USE_MMU.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
