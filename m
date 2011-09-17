From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Sep 2011 08:36:17 +0200
Subject: [Buildroot] [PATCH 08/15] package: remove useless arguments
	from AUTOTARGETS
In-Reply-To: <4c5d5efafbb287dcf231d5abed7ab0095ee6f94c.1314826231.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 31 Aug 2011 23:31:16 +0200")
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <4c5d5efafbb287dcf231d5abed7ab0095ee6f94c.1314826231.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcsrwu8u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Thanks to the pkgdir and pkgname functions, we can rewrite the
 Thomas> AUTOTARGETS macro in a way that avoids the need for each package to
 Thomas> repeat its name and the directory in which it is present.


 Thomas> diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
 Thomas> index 13a5194..6c71682 100644
 Thomas> --- a/package/fuse/libfuse.mk
 Thomas> +++ b/package/fuse/libfuse.mk
 Thomas> @@ -27,4 +27,4 @@ define LIBFUSE_CLEAN_CMDS
 Thomas>  	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
 Thomas>  endef
 
 Thomas> -$(eval $(call AUTOTARGETS,package,libfuse))
 Thomas> +$(eval $(call AUTOTARGETS))

Does those functions do the right thing here or do we need to rename the
directory to libfuse?

-- 
Bye, Peter Korsgaard
