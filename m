From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2016 22:41:31 +0100
Subject: [Buildroot] [PATCH] pv: fix build error on sparc/sparc64
In-Reply-To: <1452027708-22658-1-git-send-email-sergio.prado@e-labworks.com>
 (Sergio Prado's message of "Tue, 5 Jan 2016 19:01:48 -0200")
References: <1452027708-22658-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <87a8ojhfg4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

 > Relax linker option is enabled by default on sparc/sparc64
 > architectures, and it can't be used together with -r option, so disabled
 > it.

 > Fixes:
 > http://autobuild.buildroot.net/results/fadc6fc5500d68b91aead58b1d74887db5244f52/
 > http://autobuild.buildroot.net/results/2f30486f2d72e0277fc30febd4012825a59e4f41/
 > http://autobuild.buildroot.net/results/82ccb8f0818d1909309eaef969548f963fc6cf04/
 > ...

 > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
 > ---
 >  package/pv/pv.mk | 9 ++++++++-
 >  1 file changed, 8 insertions(+), 1 deletion(-)

 > diff --git a/package/pv/pv.mk b/package/pv/pv.mk
 > index 5346b10fc49f..80c1ec349ba7 100644
 > --- a/package/pv/pv.mk
 > +++ b/package/pv/pv.mk
 > @@ -17,6 +17,13 @@ PV_LICENSE_FILES = doc/COPYING
 >  # ensuring that host-gettext is built if gettext support is enabled;
 >  PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext)
 
 > +# --relax linker option is enabled by default on sparc/sparc64
 > +# architectures, and it can't be used together with -r option, so
 > +# disabled it.

s/disabled/disable/ (here and in the commit message).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
