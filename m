From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 11:42:41 +0100
Subject: [Buildroot] [PATCH] package/xproto_inputproto: disable
 documentation
In-Reply-To: <1542596449-55950-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Sun, 18 Nov 2018 21:00:49 -0600")
References: <1542596449-55950-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <875zwsowri.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Resolves:
 > http://autobuild.buildroot.net/results/e6b/e6badde04047e10023b97946bbff434abc07344d/

This is in fact an error when building the host- variant of the package,
so I have added the same ac_cv_path_ASCIIDOC for the host variant.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 >  package/x11r7/xproto_inputproto/xproto_inputproto.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
 > index 20169b5..5b3c63a 100644
 > --- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
 > +++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
 > @@ -11,6 +11,7 @@ XPROTO_INPUTPROTO_LICENSE = MIT
 >  XPROTO_INPUTPROTO_LICENSE_FILES = COPYING
 >  XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 >  XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 > +XPROTO_INPUTPROTO_CONF_ENV = ac_cv_path_ASCIIDOC=""
 
 >  $(eval $(autotools-package))
 >  $(eval $(host-autotools-package))
 > -- 
 > 1.9.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
