From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Nov 2013 23:49:13 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-24
In-Reply-To: <OF0E9DA113.910F94AB-ON86257C2E.00328BF4-86257C2E.003369F4@rockwellcollins.com>
References: <20131125073002.2FB821014B4@stock.ovh.net>
 <OF0E9DA113.910F94AB-ON86257C2E.00328BF4-86257C2E.003369F4@rockwellcollins.com>
Message-ID: <5293D3E9.2090207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/13 10:21, Ryan Barnett wrote:
> Thomas P, All,
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> 11/25/2013 01:30:02 AM:
>
>  >    powerpc |           host-protobuf-c-0.15 | NOK |
> http://autobuild.buildroot.net/results/10db94f960db6cc8b2fbcafa66aa487fc66f99c6/
>
> I looked into this last night and I was unable to reproduce the issue
> (from pulling the defconfig). From looking at the logs, it appears that
> the issue is that a file wasn't generated before trying to compile the
> code. In my experience, errors like below are due to the makefile not
> having their dependencies correct. I tired rebuilding this package around
> 5-7 times and I never ran into this error with the defconfig provided.

  I have seen exactly the same error before and sent a fix to the list, 
but I can't find it back... so I guess I must have imagined it.

  Anyway, there are two solutions: either disable parallel build for 
protobuf-c, or fix the dependencies. IIRC the problem is actually that 
the static and shared library are built in parallel with the same object 
files.

  Regards,
  Arnout

>
> cxx-generate-packed-data.cc:28: error: 'foo' is not a namespace-name
> cxx-generate-packed-data.cc:28: error: expected namespace-name before ';'
> token
> In file included from cxx-generate-packed-data.cc:35:
> common-test-arrays.h:44: error: 'TestEnumSmall' does not name a type
> common-test-arrays.h:45: error: 'TestEnumSmall' does not name a type
> common-test-arrays.h:47: error: 'TestEnumSmall' does not name a type
> In file included from cxx-generate-packed-data.cc:35:
> common-test-arrays.h:51: error: 'TestEnum' does not name a type
> common-test-arrays.h:52: error: 'TestEnum' does not name a type
> common-test-arrays.h:53: error: 'TestEnum' does not name a type
> cxx-generate-packed-data.cc:39: error: variable or field
> 'dump_message_bytes' declared void
> cxx-generate-packed-data.cc:39: error: 'google' has not been declared
> cxx-generate-packed-data.cc:39: error: 'message' was not declared in this
> scope
> cxx-generate-packed-data.cc:40: error: expected primary-expression before
> 'const'
>
> Thanks,
> -Ryan
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
