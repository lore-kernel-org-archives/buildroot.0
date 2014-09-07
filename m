From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Sep 2014 10:18:32 +0200
Subject: [Buildroot] [PATCH] boost: Force the target ABI for MIPS
 architecture
In-Reply-To: <1409757049-63061-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1409757049-63061-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140907101832.33d027cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 3 Sep 2014 16:10:49 +0100, Vicente Olivert Riera wrote:

> +	     abi=$(if $(BR2_MIPS_OABI32),o32,sysv) \

Are you sure this is sufficient to handle MIPS in Boost? Reading the
Boost code, I see that it also supports abi=n64 and abi=n32. Maybe you
should have a look and see if additional cases of ABIs are needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
