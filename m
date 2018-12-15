From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 11:33:52 +0100
Subject: [Buildroot] [PATCH v2 3/3] system cfg: remove mkpasswd MD5
 format option
In-Reply-To: <1544061989-7450-3-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 5 Dec 2018 20:06:29 -0600")
References: <1544061989-7450-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1544061989-7450-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87mup7axkf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > As SHA256 is now default, removing weak MD5 option.  C libraries now
 > all support the SHA methods.
 >     glibc 2.7+
 >     uclibc (bdd8362a88 package/uclibc: defconfig: enable sha-256...)
 >     musl 1.1.14+

 > One issue this would prevent, is a host tool issue with a FIPS enabled
 > system where weak ciphers/methods are disabled. It seems the crypt(3)
 > call is impacted by /proc/sys/crypto/fips_enabled (per crypt(3) man
 > page). It results in mkpasswd returning "(EPERM) crypt failed."
 > Rather then create a Buildroot host dependency check, this patch
 > removes the potential corner case from being selected.

 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I was hesitating about this, but as you can still provide a pre-hashed
md5 password (if your host system supports it) I guess it is OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
