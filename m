From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Nov 2018 09:40:55 +0100
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.33
In-Reply-To: <20181108001634.7022-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Wed, 7 Nov 2018 22:16:34 -0200")
References: <20181108001634.7022-1-casantos@datacom.com.br>
Message-ID: <87va555nqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > - Update "basic set" help to include the new "choom" utility.
 > - Re-generate checksums for license files, whose names now follow the
 >   SPDX License List.
 > - Pull a patch already applied upstream that make rtcwake use poweroff
 >   if shutdown is not found (e.g. Busybox, which the default init system
 >   on Buldroot).
 > - Pull a patch already submitted upstream to fix the output of escaped
 >   characters by agetty.

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > Supersedes: https://patchwork.ozlabs.org/patch/994061/
 > ---
 > Changes v1->v2:
 > - Pull the patches on rtcwake and agetty.
 > ---
 >  ...se-poweroff-if-shutdown-is-not-found.patch | 86 +++++++++++++++++++
 >  ...tty-fix-output-of-escaped-characters.patch | 26 ++++++
 >  package/util-linux/Config.in                  |  2 +-
 >  package/util-linux/util-linux.hash            | 14 +--
 >  package/util-linux/util-linux.mk              | 11 ++-
 >  5 files changed, 128 insertions(+), 11 deletions(-)
 >  create mode 100644 package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
 >  create mode 100644 package/util-linux/0002-agetty-fix-output-of-escaped-characters.patch

 > diff --git a/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch b/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
 > new file mode 100644
 > index 0000000000..980795fc15
 > --- /dev/null
 > +++ b/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
 > @@ -0,0 +1,86 @@
 > +From e1686b25acdedb34cc357f08f0dd3ca01c559dfd Mon Sep 17 00:00:00 2001
 > +From: Justin Chen <justinpopo6@gmail.com>
 > +Date: Thu, 1 Nov 2018 11:10:38 -0700
 > +Subject: [PATCH 1/2] rtcwake: use poweroff if shutdown is not found

Please drop the PATCH x/y (E.G. use git format-patch -N) as it tends to
get out of date.

Notice that check-package now also warns about this:

Applying: util-linux: bump to version 2.33
package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch:4: generate your patches with 'git format-patch -N'
package/util-linux/0002-agetty-fix-output-of-escaped-characters.patch:4: generate your patches with 'git format-patch -N'

Committed with that fixed to next, thanks.

-- 
Bye, Peter Korsgaard
