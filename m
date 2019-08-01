From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 21:25:02 +0200
Subject: [Buildroot] [PATCHv2] system: use system shell as root shell
In-Reply-To: <87d0hou2am.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 01 Aug 2019 21:13:37 +0200")
References: <20190801104851.32619-1-yann.morin.1998@free.fr>
 <87d0hou2am.fsf@dell.be.48ers.dk>
Message-ID: <878sscu1rl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 > Hmm, wait a second - This sed invocation doesn't make any sense to me.

 > You search for ^\root, what is the backslash for? The search should also
 > include the : separator to ensure it doesn't match 'rootfoo' or similar.

 > You replace the last : and everything after it (E.G. /bin/sh) with
 > $(SKELETON_INIT_COMMON_BIN_SH), so you drop the last :.

Sorry, sent too fast - Last issue: SKELETON_INIT_COMMON_BIN_SH is the
name of the shell without path info, so we need to ensure it is prefixed
with /bin/

-- 
Bye, Peter Korsgaard
