From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 25 Nov 2013 03:21:40 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-24
In-Reply-To: <20131125073002.2FB821014B4@stock.ovh.net>
References: <20131125073002.2FB821014B4@stock.ovh.net>
Message-ID: <OF0E9DA113.910F94AB-ON86257C2E.00328BF4-86257C2E.003369F4@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P, All,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/25/2013 
01:30:02 AM:

>    powerpc |           host-protobuf-c-0.15 | NOK | 
http://autobuild.buildroot.net/results/10db94f960db6cc8b2fbcafa66aa487fc66f99c6/


I looked into this last night and I was unable to reproduce the issue 
(from pulling the defconfig). From looking at the logs, it appears that 
the issue is that a file wasn't generated before trying to compile the 
code. In my experience, errors like below are due to the makefile not 
having their dependencies correct. I tired rebuilding this package around 
5-7 times and I never ran into this error with the defconfig provided. 

cxx-generate-packed-data.cc:28: error: 'foo' is not a namespace-name
cxx-generate-packed-data.cc:28: error: expected namespace-name before ';' 
token
In file included from cxx-generate-packed-data.cc:35:
common-test-arrays.h:44: error: 'TestEnumSmall' does not name a type
common-test-arrays.h:45: error: 'TestEnumSmall' does not name a type
common-test-arrays.h:47: error: 'TestEnumSmall' does not name a type
In file included from cxx-generate-packed-data.cc:35:
common-test-arrays.h:51: error: 'TestEnum' does not name a type
common-test-arrays.h:52: error: 'TestEnum' does not name a type
common-test-arrays.h:53: error: 'TestEnum' does not name a type
cxx-generate-packed-data.cc:39: error: variable or field 
'dump_message_bytes' declared void
cxx-generate-packed-data.cc:39: error: 'google' has not been declared
cxx-generate-packed-data.cc:39: error: 'message' was not declared in this 
scope
cxx-generate-packed-data.cc:40: error: expected primary-expression before 
'const'

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131125/f2c17f1e/attachment-0001.html>
