From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 9 Jul 2007 11:32:07 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hostap
In-Reply-To: <20070709091324.GB19774@aon.at>
References: <20070709045947.D862330066@busybox.net>
	<0707091002300.8319@somehost> <20070709091324.GB19774@aon.at>
Message-ID: <0707091121270.8319@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Jul 2007, Bernhard Fischer wrote:


> No. Fix your BR2_WGET instead:
> BR2_WGET="wget --passive-ftp"
>
> PS: sounds a bit like you did a source-check and forgot to reinstate
> your sane config afterwards.

BR2_WGET in my .config is set to this:

BR2_WGET="wget --passive-ftp -nd"

and I did not do it myself (it was supplied as default) AFAIR.

The I might have understood this target in the main Makefile:

.config.check: dependencies
	$(SED) '/BR2_WGET/s/\"$$/ --spider\"/g' .config
	touch $@

and I might still failing to understand it, but it's one thing to
temporarilly change BR2_WGET to do the checks and another thing to
force edit .config behind my back.

Could you please explain?


-- 
Cristian
