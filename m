From: michael.miller at prga.com <michael.miller@prga.com>
Date: Mon, 2 Jul 2007 07:05:53 -0500
Subject: [Buildroot] Problem building latest arm
In-Reply-To: <6B9D9C36F5A26347A593D6945C470AE90F408E@delta-two.prga.net>
References: <6B9D9C36F5A26347A593D6945C470AE90F3FF8@delta-two.prga.net><20070626062135.GA4096@aon.at><6B9D9C36F5A26347A593D6945C470AE90F4031@delta-two.prga.net><20070627162003.GA8454@aon.at>
	<6B9D9C36F5A26347A593D6945C470AE90F408E@delta-two.prga.net>
Message-ID: <6B9D9C36F5A26347A593D6945C470AE90F40BA@delta-two.prga.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard:

[a lot of snips]

I had reported problems building pthreads/ARM/EABI.

Short summary:
1) it looks like an actual test program is compiled/linked to determine
pthread support and the pthread library wasn't found in the final gcc
step.  I don't know why, since the library seems to have build OK.

2) adding --disable-libgomp to the gcc flags in buildroot resulted in a
successful build of a tool chain.  This is really more of a workaround
than addressing the underlying build issue.
  
	Regards,
	Mike
