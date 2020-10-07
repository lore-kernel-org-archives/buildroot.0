From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Oct 2020 08:02:45 +0200
Subject: [Buildroot] [PATCH v2] support/scripts/apply-patches.sh: do not
 blindly remove *.orig files
In-Reply-To: <20201006214124.GZ11621@scaer> (Yann E. MORIN's message of "Tue, 
 6 Oct 2020 23:41:24 +0200")
References: <20201006204620.21044-1-peter@korsgaard.com>
 <20201006214124.GZ11621@scaer>
Message-ID: <87mu0y4lq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2020-10-06 22:46 +0200, Peter Korsgaard spake thusly:
 >> apply-patches currently blindly removes *.orig / .*.orig files as GNU patch
 >> by default writes these as backup files when patches only apply with fuzz.
 >> 
 >> This is unfortunate as package sources may contain files ending in .orig as
 >> well, breaking the build.  Luckily GNU patch can be told to not write these
 >> backup files using the --no-backup-if-mismatch option, so used that instead
 >> of the .orig removal step.
 >> 
 >> --no-backup-if-mismatch is supported since GNU patch 2.3.8 (1997-06-17) and
 >> busybox patch if built with CONFIG_DESKTOP, but E.G.  isn't supported by the
 >> BSD patch, so add logic to dependencies.sh to error out if patch doesn't
 >> support the flag.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to master, thanks.

 > However, does that make sense to also use --no-backup-if-mismatch in our
 > LIBTOOL_PATCH_HOOK ?

We don't do any cleanup after that, but yes - I indeed think it makes
sense to ensure patch don't write out ltmain.sh.orig files.

I'll send a patch.

-- 
Bye, Peter Korsgaard
