From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 14:14:03 +0100
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.3.1
In-Reply-To: <20190112190230.13556-1-asafka7@gmail.com> (Asaf Kahlon's message
 of "Sat, 12 Jan 2019 21:02:30 +0200")
References: <20190112190230.13556-1-asafka7@gmail.com>
Message-ID: <87ef9errl0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

 > Remove the patches as they're already on upstream.
 > As a consequence, no need to autoreconf anymore.
 > Also added license hashes.

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Looking at https://github.com/zeromq/libzmq/releases, I see that this
release also fixes security issues:

CVE-2019-6250: A vulnerability has been found that would allow attackers to direct a peer to
jump to and execute from an address indicated by the attacker.
This issue has been present since v4.2.0. Older releases are not affected.
NOTE: The attacker needs to know in advance valid addresses in the peer's
memory to jump to, so measures like ASLR are effective mitigations.
NOTE: this attack can only take place after authentication, so peers behind
CURVE/GSSAPI are not vulnerable to unauthenticated attackers.
See #3351 for more details.

Once more, please mark version bumps that fix security vulnerabilities
as such so I don't miss them when backporting to the stable/LTS
branches.

-- 
Bye, Peter Korsgaard
