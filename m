From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 14:15:59 +0200
Subject: [Buildroot] [PATCH] package/freerdp: needs C++
In-Reply-To: <1443960498-22728-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 4 Oct 2015 13:08:18 +0100")
References: <1443960498-22728-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87io6mq16o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FreeRDP does not have a single C++ source file, however it insists on
 > having a C++ compiler. Removing that requirement is a bit too much
 > involving, so we just depend on it...

 > Fixes:
 >     http://autobuild.buildroot.org/results/e5b/e5bee760d52e5ee433dcb6c8a7296f99312cfcf4/

Ok, could you contact upstream and inform them about the issue?


 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/freerdp/Config.in | 8 ++++++--
 >  1 file changed, 6 insertions(+), 2 deletions(-)

 > diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
 > index b194515..cd61f41 100644
 > --- a/package/freerdp/Config.in
 > +++ b/package/freerdp/Config.in
 > @@ -1,5 +1,9 @@
 >  config BR2_PACKAGE_FREERDP
 >  	bool "freerdp"
 > +	# FreeRDP doesn ot have a single C++ source file, however it

s/doesn ot/does not/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
