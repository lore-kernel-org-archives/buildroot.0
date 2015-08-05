From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 5 Aug 2015 09:58:08 +0200
Subject: [Buildroot] [PATCH] ola: Add patch to fix linking issue
In-Reply-To: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
References: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
Message-ID: <55C1C210.4040700@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/08/2015 06:19, Simon Marchi wrote:
> This patch fixes this autobuild failure:
> 
>   http://autobuild.buildroot.net/results/e14/e14e1700d4fe359c56be57587bdb509e002e5753/build-end.log
> 
> I am not 100% sure of what happens (I am not a C++ expert at all), but
> here it is anyway.  I assume that when the definition of
> TCPSocket::ReadDescriptor is embedded in the class definition, no actual
> implementation is generated (all usages of it are inline).

No, the actual implementation is still generated.  However, the build
system pass the -fvisibility-inlines-hidden option, so it is not
exported ...

This bug should be present in the whole library, i'm surprised that
only break in this case.
