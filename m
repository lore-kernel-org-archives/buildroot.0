From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 12 Apr 2011 02:48:25 -0400
Subject: [Buildroot] prefer static libraries question
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
Message-ID: <201104120248.26575.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, March 28, 2011 17:49:56 ANDY KENNEDY wrote:
> Understanding that "prefer static libraries" is "highly experimental at
> the moment", should this export some default LDFLAGS=-static?  I
> attempted this with a very minimal set of tools (kexec, ssh, and
> busybox) and I found that busybox _does_ build statically, however, ssh
> and kexec don't.  Furthermore, openssl gets installed to the target
> (which is expected since ssh is built dynamically).  Preferring static
> libs would indicate (to me) that the _whole_ system will not have any
> libraries and each util would be linked statically.
> 
> Based upon the "at the moment" clause in the help:  is this an effort
> that is currently underway?  If yes, who is doing it and would you like
> help?  If no, since I have to do it anyway, should I start with the
> tools that I'm using and should I key off of the BR2_PREFER_STATIC_LIB
> for kexec, ssh, and anything else I run across to set *_CONF_ENV =
> LDFLAGS="-static" in the *.mk files?

the config option is "prefer" not "use only".  so the behavior tends to lean 
towards static, but not always use it.  thus things like -static are not 
enforced, and shared libs still get installed.

then again, it seems that sometimes people interpret this to mean "only do 
static", so there might be some inconsistencies in the tree.  but this is just 
a vague recollection ... i dont have any examples off the top of my head.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110412/bdc34926/attachment.asc>
