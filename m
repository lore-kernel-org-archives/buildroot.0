From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 00:21:22 +0200
Subject: [Buildroot] [PATCH] botan: new package
In-Reply-To: <1412616897-30619-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Mon, 6 Oct 2014 19:34:57 +0200")
References: <1412616897-30619-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87zjd7ed25.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/Config.in       |  1 +
 >  package/botan/Config.in | 10 ++++++++
 >  package/botan/botan.mk  | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 >  3 files changed, 73 insertions(+)
 >  create mode 100644 package/botan/Config.in
 >  create mode 100644 package/botan/botan.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 4520ba6..cb32961 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -562,6 +562,7 @@ endmenu
 
 > +define BOTAN_CONFIGURE_CMDS
 > +	(cd $(@D); ./configure.py $(BOTAN_CONF_OPTS))
 > +endef

My first thought was that this needed to depend on host-python, but we
do require python in support/dependencies/dependencies.sh and a quick
test seems to show that it works both with python 2.7 and 3.x.

Committed, thanks.

-- 
Bye, Peter Korsgaard
