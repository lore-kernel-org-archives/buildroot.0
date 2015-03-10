From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 20:41:34 +0100
Subject: [Buildroot] [PATCH 0/3] Cleanup trailing slashed from FOO_SITE
In-Reply-To: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 9 Mar 2015 23:14:49 +0100")
References: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <874mpsprm9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi,
 > this small patch set cleans up the form of FOO_SITE variables by removing all
 > trailing slashes.

 > Those slashes are useless and potentially armful, which led to introducing a
 > workaround to strip them:

 >     commit 1cbffbd015106ea90fe49e27433375769dc1035b
 >     Author: Shawn J. Goff <shawn7400@gmail.com>
 >     Date:   Fri Apr 12 09:40:30 2013 +0000

 >         eliminate double slashes caused by FOO_SITE ending in a slash
    
 >         When a FOO_SITE variable ends in a slash and gets joined with a
 >         FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
 >         has a double slash. While double-slashes are fine in unix paths, they
 >         are reserved in URIs - the part following '//' must be an authority.
    
 >         Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
 >         Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

 > This series removes all these slashes and the workaround, and updates the
 > manual which is currently suggesting an incorrect URL.

 > This work has been inspired by this comment from Arnout Vandecappelle:
 >>> > +else
 >>> > +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
 >>> > +	    $(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE:/=)/$$($(2)$($(PKG)_SITE:/=)_ACTUAL_SOURCE_TARBALL))
 >> 
 >> I think the $($(PKG)_SITE:/=) construct was just introduced because for some
 >> packages, the _SITE ends with a / and that should be stripped, and we were too
 >> lazy to fix the packages. Hm, looks like all the the external toolchain _SITEs
 >> end with a /...
 > (source: https://patchwork.ozlabs.org/patch/424980/)


 > Luca Ceresoli (3):
 >   manual: download: remove trailing slash from package FOO_SITE
 >   Remove trailing slash from all package site URLs
 >   Download: remove trailing slash cleanups for SITE URLs

Committed the first 2, thanks. I'll wait with the last one until you
have implemented the check.

-- 
Bye, Peter Korsgaard
