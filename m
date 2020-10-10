From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:44:01 +0200
Subject: [Buildroot] [PATCH v2] support/scripts/apply-patches.sh: do not
 blindly remove *.orig files
In-Reply-To: <20201006204620.21044-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 6 Oct 2020 22:46:20 +0200")
References: <20201006204620.21044-1-peter@korsgaard.com>
Message-ID: <87o8l9erqm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > apply-patches currently blindly removes *.orig / .*.orig files as GNU patch
 > by default writes these as backup files when patches only apply with fuzz.

 > This is unfortunate as package sources may contain files ending in .orig as
 > well, breaking the build.  Luckily GNU patch can be told to not write these
 > backup files using the --no-backup-if-mismatch option, so used that instead
 > of the .orig removal step.

 > --no-backup-if-mismatch is supported since GNU patch 2.3.8 (1997-06-17) and
 > busybox patch if built with CONFIG_DESKTOP, but E.G.  isn't supported by the
 > BSD patch, so add logic to dependencies.sh to error out if patch doesn't
 > support the flag.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
