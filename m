From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:03:45 +0200
Subject: [Buildroot] [RFC PATCH 0/2] Hack for perl module subdirectories
In-Reply-To: <20180813175645.11088-1-chrismcc@gmail.com>
References: <20180813175645.11088-1-chrismcc@gmail.com>
Message-ID: <20180813230345.5e2a684f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 10:56:43 -0700, Christopher McCrory wrote:

> for AR, CC, xFLAGS, etc.  This "works", but there should be a better
> way. Hence the RFC.
> 
> Also there is a package, libxml-parser-perl, that is a host only perl
> xml-parser package needed by host-intltool and metacity.  Should they
> stay seprate or be merged?

libxml-parser-perl is intentionally not using the perl-package
infrastructure, because we don't want to require building host-perl to
build host-intltool.

Some libxml-parser-perl is using the system-wide Perl, which is a
mandatory Buildroot dependency.

Perhaps we should add a comment in libxml-parser-perl.mk to explain
this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
