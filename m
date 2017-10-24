From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 08:08:58 +0200
Subject: [Buildroot] Aarch32 support on aarch64
In-Reply-To: <CANEuBv6hKFwqNw+4YXpyjdUF2wEu9s_0-Z1f8LzAQFhgfaMbUQ@mail.gmail.com>
 (Markus Mayer's message of "Thu, 12 Oct 2017 14:06:11 -0700")
References: <CANEuBv6hKFwqNw+4YXpyjdUF2wEu9s_0-Z1f8LzAQFhgfaMbUQ@mail.gmail.com>
Message-ID: <87vaj55b7p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <code@mmayer.net> writes:

Hi,

 > So far, I have tried my luck using a post-install script. It works to
 > the point that I get a root file system that can execute both types of
 > binaries, but because the post-install script needs to muck with
 > directory names and symlinks under target/lib*, this approach doesn't
 > really work very well doing incremental builds. Buildroot as a whole
 > still expects target/lib to be the destination for 64 bit libraries,
 > but that is no longer the case after the post-install script changed
 > this and placed the 32 bit libraries there.

Buildroot is indeed not forseen for mixed 32/64bit setups. Potential
alternatives:

- Run 32bit application in chroot
- Statically link application

-- 
Bye, Peter Korsgaard
