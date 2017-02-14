From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 13:10:25 +0100
Subject: [Buildroot] [PATCH] kmsxx: not available on m68k
In-Reply-To: <20170214114204.GD12810@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Tue, 14 Feb 2017 12:42:04 +0100")
References: <20170213093502.26507-1-peter@korsgaard.com>
 <20170213132925.5324f141@free-electrons.com>
 <8760kema97.fsf@dell.be.48ers.dk>
 <20170213213713.GA12810@waldemar-brodkorb.de>
 <87fujhkrik.fsf@dell.be.48ers.dk>
 <20170214114204.GD12810@waldemar-brodkorb.de>
Message-ID: <87tw7xj7m6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

Hi,

 >> Will you send patches to do this?

 > I can try. But now I am back to my original problem, how do I
 > overwrite CFLAGS/CXXFLAGS correctly for a single package build with
 > cmake?

 > Any examples in the tree?

I'm far from a cmake expert, but I would expect something like:

KMSXX_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -fno-dwarf2-cfi-asm"

Would work. rpi-userland does something similar.

-- 
Bye, Peter Korsgaard
