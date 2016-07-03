From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 09:36:29 +0200
Subject: [Buildroot] [PATCH 1/1] new package: alsacap
In-Reply-To: <7cdd4c8373ad3a3a08131b2eaf5e2bcc@poczta.spox.org> ("Wojciech
 =?utf-8?Q?Nizi=C5=84ski=22's?= message of "Wed, 06 Apr 2016 16:37:32
 +0200")
References: <1459926063-11265-1-git-send-email-niziak@spox.org>
 <CAGm1_ks=HSe8v+7e2WrFj=M9SpuLkav=WS_xhMtB76521wJ3rw@mail.gmail.com>
 <7cdd4c8373ad3a3a08131b2eaf5e2bcc@poczta.spox.org>
Message-ID: <87eg7b41he.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wojciech" == Wojciech Nizi?ski <niziak@spox.org> writes:

 > Hello!
 > Corrected patch below.
 > Hash file added, but hash is not used, because source comes from git
 > repository.

 > Alsa capability tool displays the capabilities of your sound card and
 > its ALSA driver

 > Signed-off-by: Wojciech Nizinski <niziak@spox.org>

Care to send an updated patch with the fixes suggested by Arnout and
Jerzy? Also please add a locally calculated sha256 for the .hash file.

Looking at the upstream code I see it will need to be fixed for static
linking. Right now it is simply hardcoded to link with
-lasound. Alsa-lib provides a .pc files, so ideally it should use
pkg-config to get the right linker/compiler flags.

In the mean time I will mark this patch as changes requested in
patchwork.

-- 
Bye, Peter Korsgaard
