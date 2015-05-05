From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 05 May 2015 10:44:18 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150505095952.4ddfd5b4@free-electrons.com>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
Message-ID: <5548C932.3050502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/2015 04:59 AM, Thomas Petazzoni wrote:
>>       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/cd2e617f8e2b00581ab5936029f85e62ed3259ba/
> 
> md2.o: In function `md2_sum':
> md2.c:(.text+0x18): undefined reference to `EVP_md2'
> 
> Gustavo, maybe? Has OpenSSL removed md2 support by default or something
> like that?

Yes, md2 has been disabled for some time, the problem is that ipmiutil's
configure uses LIB_DIR to check for md2 availability in libcrypto.
But we can't override that otherwise libipmiutil doesn't get installed
in the correct place :-/
Quick solution is to force it off, ideally a well-done tests would be
better.
Regards.
