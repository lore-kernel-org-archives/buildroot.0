From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 11:37:28 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: fix build with pcre2
In-Reply-To: <20180928173419.9122-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 Sep 2018 19:34:19 +0200")
References: <20180928173419.9122-1-fontaine.fabrice@gmail.com>
Message-ID: <87pnwv2unb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add a patch to customize path to pcre-config or pcre2-config instead of
 > messing with PCREDIR, PCRE2DIR and PCRE2_LDFLAGS variables

 > Fixes:
 >  - http://autobuild.buildroot.net/results/490bc87b43074623d2338cfd2acb77d5de0abaa6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  ...ow-configuration-of-pcre-config-path.patch | 56 +++++++++++++++++++
 >  package/haproxy/haproxy.mk                    | 15 +----
 >  2 files changed, 58 insertions(+), 13 deletions(-)
 >  create mode 100644 package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch

 > diff --git a/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch b/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch
 > new file mode 100644
 > index 0000000000..21f36520df
 > --- /dev/null
 > +++ b/package/haproxy/0001-Allow-configuration-of-pcre-config-path.patch
 > @@ -0,0 +1,56 @@
 > +From f3dcdf6c9ffea4d9b89dca9706a48c44bd76c470 Mon Sep 17 00:00:00 2001
 > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +Date: Fri, 28 Sep 2018 19:21:26 +0200
 > +Subject: [PATCH] Allow configuration of pcre-config path
 > +
 > +Add PCRE_CONFIGDIR variable to allow the user to configure path of
 > +pcre-config or pcre-config2 instead of using the one in his path.
 > +This is particular useful when cross-compiling.
 > +
 > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I think it would have been a bit cleaner to have PCRE_CONFIG /
PCRE2_CONFIG variable instead, but if upstream is happy with this then
that is also fine.

Please don't forget to submit upstream.

Committed, thanks.

-- 
Bye, Peter Korsgaard
