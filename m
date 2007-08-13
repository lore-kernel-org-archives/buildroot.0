From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 13 Aug 2007 22:37:00 +0200
Subject: [Buildroot] TinyX woes...
In-Reply-To: <1187036974.6223.17.camel@elrond.sweden.atmel.com>
References: <1187036974.6223.17.camel@elrond.sweden.atmel.com>
Message-ID: <1187037420.6223.20.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-08-13 klockan 22:29 +0200 skrev Ulf Samuelsson:
> TinyX currently is built using
> make $(TARGET_CONFIGURE_OPTS) World
> but this fails miserably for ARM.
> 
> Some utilities are then built using the cross compiler
> and when executed on the host, they obviously fail on non-X-86 targets.
> 
> I tried a patch which forces the use of HOSTCC for make,
> but there are some temp files ("/tmp/xxxx") which are executed
> and fails since they are built using the cross compiler.
> 
> TinyX seems to rely on WCHAR support, since it uses
> MB_CHAR_MAX (The largest size of a character)

Sorry, that was MB_CUR_MAX

BR
Ulf
