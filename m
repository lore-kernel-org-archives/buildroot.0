From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 4 Dec 2013 10:58:21 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-03
In-Reply-To: <20131204073002.8453B101504@stock.ovh.net>
References: <20131204073002.8453B101504@stock.ovh.net>
Message-ID: <529F0ACD.1080803@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/2013 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2013-12-03
> ===============================
>
>         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/6a2bcade333b4e7a363aea04480daa9200a1813a/
>        mips |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/b635ea2e38ed0b2b451da96047b8f8c9214cc1b7/

Already fixed by the gnutls revert bump: 
http://git.buildroot.net/buildroot/commit/?id=2648ecfc106f1d296837f8ba49410ab0c877b16f

>      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/35406e2aa9210f436c750b889a79c65fd8f5ded1/

This is a problem with certain arches (IA64, MIPS and SPARC) in uClibc. 
The file "uClibc/libc/sysdeps/linux/${ARCH}/bits/siginfo.h" has a struct 
called sigevent. That struct has "__pid_t _tid;" in some arches, but not 
on IA64, MIPS and SPARC, that's why it fails. glibc, for instance, has 
that member on all arches.

-- 
Vincent
