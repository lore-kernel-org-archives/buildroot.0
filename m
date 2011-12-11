From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Dec 2011 23:41:44 +0100
Subject: [Buildroot] [PATCH 3/3] libglib2: bump to version 2.30.2
In-Reply-To: <1323171959-24873-4-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Tue, 6 Dec 2011 12:45:59 +0100")
References: <1323171959-24873-1-git-send-email-zonque@gmail.com>
 <1323171959-24873-4-git-send-email-zonque@gmail.com>
Message-ID: <874nx6bujb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> Important changes for this version bump are that libffi (for both host
 Daniel> and target) is now a hard requirement for libglib.

 Daniel> The patch regarding atomic function seems obsolete now, as this part of
 Daniel> the lib was rewritten. I couldn't figure which platform this used to
 Daniel> break on, but in worst case, it would be trivial to redo this one-liner.

 Daniel> Also, there's an issue in the upstream package that makes configure fail
 Daniel> for cross-builds with "configure: error: cannot run test program while
 Daniel> cross compiling". This issue was reported, but the patch was rejected.
 Daniel> Appearantly, the developers don't expect people to use configure for
 Daniel> cross environments anymore, so we have to maintain this patch locally.
 Daniel> For more information, see

Thanks. Instead of using this patch I would prefer to just pass
glib_cv_have_qsort_r=yes/no in LIBGLIB2_CONF_ENV like Colin
suggested. That way we can set it to yes for external glibc-based
toolchains (BR2_TOOLCHAIN_EXTERNAL_GLIBC) and no otherwise.

Care to respin this patch with that change?

Thanks.

-- 
Bye, Peter Korsgaard
