From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 11:00:13 +0100
Subject: [Buildroot] [PATCH] package/minidlna: fix static build
In-Reply-To: <87mvua9uzr.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 19 Nov 2015 10:52:24 +0100")
References: <1447889466-8504-1-git-send-email-yann.morin.1998@free.fr>
 <87mvua9uzr.fsf@dell.be.48ers.dk>
Message-ID: <87io4y9umq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> libvorbix.pc does not exist, it is named vorbis.pc.

 > libvorbis.pc

 >> Also, sqlite3 was missing when querying pkg-config.

 > No autobuilder references?

Looking at the autobuilder failures
(http://autobuild.buildroot.net/?reason=minidlna-1.1.5) they all seem to
be caused by BR2_COMPILER_PARANOID_UNSAFE_PATH and the configure script
adding /usr/local when checking for libraries/headers :/

-- 
Bye, Peter Korsgaard
