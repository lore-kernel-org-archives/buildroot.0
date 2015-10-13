From: Anders Norman <norman.anders@gmail.com>
Date: Tue, 13 Oct 2015 11:40:48 +0200
Subject: [Buildroot] Why does host-boost contain only a minimal selection?
Message-ID: <561CD1A0.8070006@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I have a system set up where I build both natively (for running unit
tests) and cross. My application uses libboost (package/boost) and fails
to build natively because the linker can't find libboost-filesystem.so.
I investigated the issue and find the following in package/boost/boost.mk:

# keep host variant as minimal as possible
HOST_BOOST_FLAGS = --without-icu --without-libraries=$(subst
$(space),$(comma),atomic chrono context coroutine date_time exception
filesystem graph graph_parallel iostreams locale log math mpi
program_options python random regex serialization signals system test
thread timer wave)

I guess this is why my host-boost does not contain the filesystem part.
What is the reason for removing almost all parts of host-boost when the
individual selection flags are already present and used correctly for
the cross build?

Anders
