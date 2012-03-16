From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Mar 2012 11:56:44 +0100
Subject: [Buildroot] [PATCH] xfsprogs: Add missing timestamp files
In-Reply-To: <1331894250-26337-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Fri, 16 Mar 2012 10:37:30 +0000")
References: <1331894250-26337-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87zkbgq0er.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> Added a compiled and an installed timestamp files for compilation and
 Markos> installation phases respectively.

But these files don't do anything if you don't refer to them
anywhere. I would rather like to see a conversion to AUTOTARGET.

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos>  package/xfsprogs/xfsprogs.mk |    2 ++
 Markos>  1 files changed, 2 insertions(+), 0 deletions(-)

 Markos> diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
 Markos> index 68db2f7..ba06d4a 100644
 Markos> --- a/package/xfsprogs/xfsprogs.mk
 Markos> +++ b/package/xfsprogs/xfsprogs.mk
 Markos> @@ -68,6 +68,7 @@ else
 Markos>  	$(STRIPCMD) $(XFSPROGS_DIR)/lib*/lib*.so.*.*
 Markos>  endif
 Markos>  	touch -c $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
 Markos> +	touch $(XFSPROGS_DIR)/.compiled

-- 
Bye, Peter Korsgaard
