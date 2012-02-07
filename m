From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 20:53:00 +0100
Subject: [Buildroot] Customize package not copy .svn .git etc?
In-Reply-To: <jgrm1h$3h3$1@dough.gmane.org>
References: <jgrkfd$m8n$1@dough.gmane.org> <jgrm1h$3h3$1@dough.gmane.org>
Message-ID: <201202072053.00460.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 07 February 2012 18:12:17 Grant Edwards wrote:
> The other obvious choice would be to use tar:
> 
> $(BUILD_DIR)/.customize:
>         tar -c -f - -C $(CUST_DIR) --exclude-vcs --exclude-backup . | tar -x -f - -C $(TARGET_DIR)
>         touch $@
> 
> I'd be happy to submit a patch containing the latter if everybody
> agrees that they don't want vcs files, backup files, and lockfiles
> copied.  It is specific to gnu tar -- I assume that's not a problem?

 The tar way is indeed a good idea.  And if you use $(TAR) instead of
plain tar, it's guaranteed to be gnu tar.

 As Luca mentioned, customize will be deprecated in favour of the 
rootfs-additions approach.  We'll add this to the target/generic/Config.in
and target-finalize.  If you'd like to prepare a patch for that, you're
more than welcome!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
