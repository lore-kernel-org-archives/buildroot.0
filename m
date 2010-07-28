From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Wed, 28 Jul 2010 12:06:05 +0200
Subject: [Buildroot] [RESEND/PATCH] Git/Svn downloaders,
	with source-check and external-deps
Message-ID: <1280311574-8017-1-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Hopefully this should be one of the last resends of this patch series. I
integrated the fix to the gzip call Quotient Remainder pointed out, as well as
re-implemented the source-check and external-deps features.

The wget-show-external-deps script could thus be removed, and the package
download override capability reverted.

Note that there still is a problem with source and source-check when using an
external toolchain as it tries to download/check for gcc-.tar.gz (GCC version
remains undefined when using an external toolchain, but it shouldn't try to
download it anyways). This is not a regression of this patch series though, so
I'll leave it like that until we find a clever way to fix it.

Thanks for your review,
- Maxime
