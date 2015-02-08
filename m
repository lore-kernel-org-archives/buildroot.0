From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Feb 2015 22:24:49 +0100
Subject: [Buildroot] [PATCH 1/1] webkit : fix single line comments
In-Reply-To: <DCBE421ABABD4C348438B77A8C49F446@JohanW7>
References: <1423402220-10090-1-git-send-email-sagaert.johan@skynet.be>
 <20150208155730.2a1b569e@free-electrons.com>
 <D347304386AE432996658D49AB648DAE@JohanW7>
 <20150208181051.51ff61b7@free-electrons.com>
 <DCBE421ABABD4C348438B77A8C49F446@JohanW7>
Message-ID: <20150208222449.481735be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 8 Feb 2015 21:56:47 +0100, Sagaert Johan wrote:

> Here is the output with make V=1

Thanks, the problem is the -ansi flags passed to gcc, which puts gcc
into ANSI compliant mode, which indeed rejects C++ style comments. I
believe this option should probably be removed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
