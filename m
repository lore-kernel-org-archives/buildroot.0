From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 20:59:15 +0100
Subject: [Buildroot] [PATCH] fs/common.mk: delay evaluation of variables.
In-Reply-To: <1358690593-8163-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 20 Jan 2013 15:03:13 +0100")
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <1358690593-8163-1-git-send-email-arnout@mind.be>
Message-ID: <87fw1veics.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> This makes things easier to understand and more consistent with
 Arnout> the pkg-infra.  For example, it removes the need for '$$@' in
 Arnout> the CMD variables of fs/*/*.mk.

 Arnout> It also makes it possible to update the variables later,
 Arnout> e.g. in the package override file.

 Arnout> It also makes sure that the date will be recorded correctly in
 Arnout> Yann E. Morin's patch that logs the MESSAGE macros to a file.

 Arnout> The fs/*/*.mk must be updated as well because the '$@'
 Arnout> shouldn't be quoted anymore in the CMD variables or the hooks.

 Arnout> The $(eval ...) for the dependencies is redundant, because the
 Arnout> $(ROOTFS_TARGET) variable is already eval'd. Note that it is
 Arnout> only redundant if the evaluation of the uses of the variable is
 Arnout> also delayed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
