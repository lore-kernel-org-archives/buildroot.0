From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:16:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: Allow to build
 with uclibc but w/o mausezahn
In-Reply-To: <2b7060f3-d03b-a456-4796-b5a6f81c72d9@mind.be>
References: <20190304085741.13782-1-vadim4j@gmail.com>
 <899f39cb-501b-ef06-7884-5d4f4ef7909a@mind.be>
 <20190306052900.rlg6ebkp5e4ewtzu@vkochan-ThinkPad-T470p>
 <2b7060f3-d03b-a456-4796-b5a6f81c72d9@mind.be>
Message-ID: <20190328181632.10308c68@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Mar 2019 10:28:26 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Now you mention it, it looks like the libpcap dependency is also only used for
> mausezahn...

Not so sure:

$ grep pcap.h bpf_comp.c 
#include <pcap.h>
$ grep bpf_comp netsniff-ng/Makefile 
netsniff-ng-objs +=	bpf_comp.o

$ grep -r "lpcap" *
configure:	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap >> config.log 2>&1
mausezahn/Makefile:			-lpcap \
netsniff-ng/Makefile:netsniff-ng-libs +=	-lpcap

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
