From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 22:27:58 +0200
Subject: [Buildroot] [PATCH 3/5] libao: Remove OSS plugin when ALSA is
	enabled
In-Reply-To: <1396979109-10691-3-git-send-email-paul@crapouillou.net> (Paul
 Cercueil's message of "Tue, 8 Apr 2014 19:45:07 +0200")
References: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
 <1396979109-10691-3-git-send-email-paul@crapouillou.net>
Message-ID: <87bnvemwtt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > From: Maarten ter Huurne <maarten@treewalker.org>
 > At runtime, libao will load all plugins, even ones that will never be used.
 > Since libao will prefer ALSA over OSS by default anyway, it is pretty safe
 > to exclude the OSS plugin.

 > There is no configure option for disabling the OSS plugin, so we remove
 > the shared object in a post-install hook.

 > Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>

Committed with a note explaining why we now pass --disable-broken-oss,
thanks.

-- 
Bye, Peter Korsgaard
