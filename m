From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 20:12:12 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <1528737656.28705.131.camel@impinj.com> (Trent Piepho's message
 of "Mon, 11 Jun 2018 17:20:57 +0000")
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
Message-ID: <87efh73on7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

Hi,

 > So having extracted an SDK, in an automated CI script, how does one use
 > it?  I'll add it to the Docker container:

 > ARG sdk_file
 > ENV SDK=/mnt/sdk
 > ADD --chown=user:user ${sdk_file} ${SDK}

 > Now it needs to be relocated.  Something like:

 > RUN cd ${SDK}/buildroot-sdk.arm-buildroot-linux-gnueabihf-2018.02-00035-ge588bdd3e8 && ./relocate-sdk.sh

 > Is the problem with using this tarball apparent?  The dockerfile needs
 > to be hand edited on every single build to use the correct path to the
 > SDK.

Why not use a wildcard? E.G. cd ${SDK}/buildroot-sdk* && ./relocate-sdk.sh?

Nothing else should match the wildcard inside the container.

-- 
Bye, Peter Korsgaard
