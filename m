From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Feb 2011 20:15:29 +0100
Subject: [Buildroot] [PATCH 2/2] target gcc: fix recompilation issue
In-Reply-To: <1297347549-647-2-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Thu, 10 Feb 2011 11:19:09 -0300")
References: <1297347549-647-1-git-send-email-gustavo@zacarias.com.ar>
	<1297347549-647-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k4h7hfam.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> gcc_target wants uclibc_target which is now first stage uclibc (not
 Gustavo> real, from the NPTL build stage addition).
 Gustavo> This triggers gcc-final to be rebuilt (albeit cached) and reinstalled,
 Gustavo> thus touching all the stamps around and triggering a rebuild of
 Gustavo> gcc_target.
 Gustavo> Switch to $(STAMP_DIR)/gcc_libs_target_installed instead so that we only
 Gustavo> depend on the last stage of cross gcc being installed to rebuild.

Committed, thanks.

-- 
Bye, Peter Korsgaard
