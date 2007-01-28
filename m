From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 28 Jan 2007 16:37:37 +0100
Subject: [Buildroot] AVR32 support during ./configure
In-Reply-To: <20070128152734.GS28221@aon.at>
References: <1169997842.21218.2.camel@elrond.sweden.atmel.com>
	<20070128152734.GS28221@aon.at>
Message-ID: <20070128153737.GT28221@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 28, 2007 at 04:27:34PM +0100, Bernhard Fischer wrote:
>On Sun, Jan 28, 2007 at 04:24:02PM +0100, Ulf Samuelsson wrote:
>>Author:	Ulf Samuelsson
>>Date:	2007-01-28
>>
>>Log:
>>Support AVR32 during GNU configuration
>
>Merged. Thanks

You need to make sure that packages pick this up as well, don't you?
$(FOO_DIR)/.configured:
	(cd $(@D) ; rm -rf config.cache ; \
	 $(CONFIG_UPDATE); \
	 ./configure ... \
