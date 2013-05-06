From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 09:34:24 +0200
Subject: [Buildroot] [PATCH 1/3] python-setuptools: forkbump and add
	workaround for shebang
In-Reply-To: <516D254A.4010707@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 16 Apr 2013 07:17:46 -0300")
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
 <516CEF3C.6070505@mind.be> <516D254A.4010707@zacarias.com.ar>
Message-ID: <87a9o8lfy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Please split this long line. Also, maybe it's worth explaining why we
 >> want --single-version-externally-managed?

 Gustavo> That's for the trick to work, when python builds an egg (zip
 Gustavo> file) in the build phase not only are we wasting time doing
 Gustavo> double decompression later on the target but we are also
 Gustavo> finishing up the package (kind of a mini-install phase) into
 Gustavo> the egg.

 Gustavo> That makes the trick fail (probably solvable by doing
 Gustavo> --execute in the build itself, didn't try since it's not the
 Gustavo> way IMHO).  I'll add a note since it's required for other
 Gustavo> python packages that do use setuptools/distribution.  V2 when
 Gustavo> Thomas confirms it solves his issues with lava-test, did it
 Gustavo> for me in my tests.

Did this ever get tested? Thomas, could you send your ack / Gustavo,
could you send a v2 fixing the issues pointed out by Arnout?

-- 
Bye, Peter Korsgaard
