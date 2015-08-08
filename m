From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:44:45 +0200
Subject: [Buildroot] [PATCH] ola: Add patch to fix linking issue
In-Reply-To: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
References: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
Message-ID: <20150808124445.79092e05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Marchi,

On Wed,  5 Aug 2015 00:19:40 -0400, Simon Marchi wrote:
> This patch fixes this autobuild failure:
> 
>   http://autobuild.buildroot.net/results/e14/e14e1700d4fe359c56be57587bdb509e002e5753/build-end.log
> 
> I am not 100% sure of what happens (I am not a C++ expert at all), but
> here it is anyway.  I assume that when the definition of
> TCPSocket::ReadDescriptor is embedded in the class definition, no actual
> implementation is generated (all usages of it are inline).  When object
> libolaopenpixelcontrol.so tries to reference it somehow, it results in
> an undefined reference.  Moving the definition in the cpp retains it. If
> you have a clear explanation of what happens, I'd be happy to read it.
> 
> Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>

Could you report the problem to the upstream ola project and see what
they say? Also, they have a 0.9.7 release, maybe you want to try it?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
