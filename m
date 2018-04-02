From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 16:10:32 +0200
Subject: [Buildroot] [v5 04/11] support/download: make sure the download
 folder is created
In-Reply-To: <20180402130934.19274-4-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 15:09:27 +0200")
References: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
 <20180402130934.19274-4-maxime.hadjinlian@gmail.com>
Message-ID: <87in99n1gn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > At the moment, it means that we make sure that BR2_DL_DIR is created, in
 > the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  package/pkg-download.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
 > index d309f7612c..e88d3f9fda 100644
 > --- a/package/pkg-download.mk
 > +++ b/package/pkg-download.mk
 > @@ -88,6 +88,7 @@ endif
 >  endif
 
 >  define DOWNLOAD
 > +	$(Q)mkdir -p $($(PKG)_DL_DIR)/

Committed after dropping the trailing /, thanks.

-- 
Bye, Peter Korsgaard
