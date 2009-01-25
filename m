From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 15:21:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
In-Reply-To: <20090125081438.BE00D76D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 08\:14\:38 +0000 \(UTC\)")
References: <20090125081438.BE00D76D28@busybox.osuosl.org>
Message-ID: <87vds3fov1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 08:14:37 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25011

 ulf> Log:
 ulf> Fix make problems with perl

 ulf> +++ trunk/buildroot/package/microperl/microperl.mk	2009-01-25 08:14:37 UTC (rev 25011)
 ulf> @@ -23,18 +23,38 @@
 
 ulf>  $(MICROPERL_DIR)/.source: $(DL_DIR)/$(MICROPERL_SOURCE)
 ulf>  	$(MICROPERL_CAT) $(DL_DIR)/$(MICROPERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ulf> +	(cd $(MICROPERL_DIR); chmod -R u+w *)

Why the subshell? what's wrong with chmod -R u+w $(MICROPERL_DIR)/ ?

-- 
Bye, Peter Korsgaard
