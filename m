From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 23:24:10 +0200
Subject: [Buildroot] [PATCH master+LTS] package/libopenssl: fix target
 architecture for MIPS64n32
In-Reply-To: <20200619065033.8982-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 19 Jun 2020 08:50:33 +0200")
References: <20200619065033.8982-1-patrickdepinguin@gmail.com>
Message-ID: <87sgdswjyd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Commit 1ebb35ee5fb7bd5e6278a84ac2c18aa0a38056fb changed the libopenssl
 > target architecture to 'linux-generic64' for 64-bit archs based on
 > BR2_ARCH_IS_64. However, MIPS64n32 has BR2_ARCH_IS_64 set, but is a 32-bit
 > ABI. On such board, libopenssl needs to be configured with linux-generic32
 > to function properly.

 > One symptom of this problem is that ssh-keygen hangs on key generation,
 > waiting for more random bits. See [1] for the discussion with openssl
 > upstream.

 > Thanks to Ronny Meeus for investigating the issue and kudos to the openssl
 > community for their responsive and helpful interaction!

 > Reported-by: Ronny Meeus <ronny.meeus@nokia.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 > [1] https://mta.openssl.org/pipermail/openssl-users/2020-June/012565.html

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
