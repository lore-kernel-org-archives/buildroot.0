From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2014 23:39:07 +0100
Subject: [Buildroot] [PATCH] Rename TAR_OPTIONS to BUILDROOT_TAR_OPTIONS
	to avoid conflict with GNU tar.
In-Reply-To: <87ob2ymkxn.fsf@spindle.srvr.nix> (nix@esperi.org.uk's message of
 "Sun, 26 Jan 2014 22:34:44 +0000")
References: <878uu3pw4z.fsf@spindle.srvr.nix>
 <8738ka1jme.fsf@dell.be.48ers.dk> <87ob2ymkxn.fsf@spindle.srvr.nix>
Message-ID: <87mwiiz7uc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nix" == Nix  <nix@esperi.org.uk> writes:

 > On 26 Jan 2014, Peter Korsgaard verbalised:
 >> But this should only be an issue if TAR_OPTIONS are exported to the
 >> environment, which it isn't:
 >> 
 >> git grep export | grep -c TAR_OPTIONS
 >> 0
 >> 
 >> Do you perhaps have a local patch which exports it?

 > Ah, that explains it! I have TAR_OPTIONS set (to --wildcard) in my
 > /etc/environment, which means it lands in make's environment and causes
 > make to update the environment variable when the local makefile variable
 > of the same name is set. Since this export is actually recommended in
 > tar's NEWS and near the top of appendix A in the tar info docs, I
 > suspect a good few 'old hands' used to the old wildcarding GNU tar
 > behaviour might have it set.

 > So an alternative (much smaller) patch is to keep the variable name the
 > same, but explicitly unexport it, to keep the local environment from
 > torpedoing things like this. (Presumably we never want the local
 > buildroot TAR_OPTIONS to propagate into the environment like this.)

Indeed, and likewise we don't want a user's custom TAR_OPTIONS to affect
the behaviour of Buildroot, so we should just unexport it like we do for
E.G. GREP_OPTIONS.

Care to send a patch doing that? Thanks.

-- 
Bye, Peter Korsgaard 
