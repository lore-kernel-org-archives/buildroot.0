From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Jul 2010 15:08:49 +0200
Subject: [Buildroot] libQt3Support.so missing in image on target
In-Reply-To: <l5aiux.md2l92@webmail.variomedia.de> (Karl Krach's message of
	"Fri, 09 Jul 2010 14:32:57 +0200")
References: <l5aiux.md2l92@webmail.variomedia.de>
Message-ID: <87tyo82466.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Karl" == Karl Krach <mailinglists@blueSpirit.la> writes:

 Karl> Hello,

 Karl> I would like to commit two patches. First, if you install qt3support the
 Karl> libQt3Support.so is only installed to the STAGING_DIR but missing in the
 Karl> TARGET_DIR - thus on the target.

Committed, thanks.

 Karl> Second, I run from time to time in the problem, that I remove the build
 Karl> directory on reconfigure/recompile but not the libraries from the STATING_DIR
 Karl> - this would be a tiny (but nice) feature.

 Karl> Thanks a lot,

Isn't that what the qt-clean target is for? What is the use case exactly?

 Karl> --- package/qt/qt.mk_qt3support	2010-07-09 14:24:02.000000000 +0200
 Karl> +++ package/qt/qt.mk_recompile	2010-07-09 14:26:09.000000000 +0200
 Karl> @@ -520,6 +520,7 @@
 Karl>  		-nomake demos \
 Karl>  	)
 Karl>  	touch $@
 Karl> +	rm -rf $(STAGING_DIR)/usr/lib/libQt*

What about the header files?

-- 
Bye, Peter Korsgaard
