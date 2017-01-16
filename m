From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:19:27 +0100
Subject: [Buildroot] [PATCH 3/3] tslib: use upstream .tar.xz archive
In-Reply-To: <4d652fd2c57debea2ae6732183afcc5105226f0f.1484425049.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 14 Jan 2017 22:17:29 +0200")
References: <9af1cba158ce6dcb96f5f121d4105895fea911b9.1484425049.git.baruch@tkos.co.il>
 <4d652fd2c57debea2ae6732183afcc5105226f0f.1484425049.git.baruch@tkos.co.il>
Message-ID: <87shojdwog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Save some network bandwidth.
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/tslib/tslib.hash | 2 +-
 >  package/tslib/tslib.mk   | 1 +
 >  2 files changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
 > index a80944c2174c..cdbe0d2cbed3 100644
 > --- a/package/tslib/tslib.hash
 > +++ b/package/tslib/tslib.hash
 > @@ -1,2 +1,2 @@
 >  # Locally generated
 > -sha256  599f51c265158e7801b166e879e19759e8d3e5fdf2fa99c630698fe162a41d56  tslib-1.3.tar.gz
 > +sha256  e935101adca980a14d1a13362796222575f99e6a41db585e8358fffddb98d92c  tslib-1.3.tar.xz
 > diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
 > index 7f74ca5fed04..df3de25a1b3a 100644
 > --- a/package/tslib/tslib.mk
 > +++ b/package/tslib/tslib.mk
 > @@ -6,6 +6,7 @@
 
 >  TSLIB_VERSION = 1.3
 >  TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 > +TSLIB_SOURCE = tslib-1.3.tar.xz

Committed after changing this to use $(TSLIB_VERSION) instead of
hardcoding 1.3, thanks.

-- 
Bye, Peter Korsgaard
