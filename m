From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 13:43:22 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <1697965583.2026245.1528505922702.JavaMail.zimbra@datacom.com.br>
 (Carlos Santos's message of "Fri, 8 Jun 2018 21:58:42 -0300 (BRT)")
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer>
 <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <1697965583.2026245.1528505922702.JavaMail.zimbra@datacom.com.br>
Message-ID: <87zhv13pd1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

Hi,

 >> There is (in my even less humble opinion) one way that we can solve this
 >> generically: by adding a genimage filesystem. genimage is able to create
 >> separate filesystem images for subtrees. so it can cover many use cases in a
 >> generic way.
 >> 
 >> There are probably a few gotchas, but I still believe it should be possible.

 > Genimage is unable to deal with GPT partitioning, which is much better
 > to use with UEFI BIOS. I dropped it in favour of a custom script that
 > creates an empty disk image file using sfdisk to partition it using a
 > file containing the partitioning scheme. Then it reads the start offset
 > an size of each partition and dumps the corresponding FS image there.

It would really be nice if genimage was extended to also handle GPT
partitioning. Did anyone discuss this with upstream?

-- 
Bye, Peter Korsgaard
