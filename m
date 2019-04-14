From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:21:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tss: add upstream patch to
 drop hardcoded -lgcrypt from tss2-esys.pc
In-Reply-To: <20190408115648.11004-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 8 Apr 2019 13:56:46 +0200")
References: <20190408115648.11004-1-peter@korsgaard.com>
Message-ID: <87v9zgfflm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > tss2-esys.pc contains a hardcoded -lgcrypt even though the openssl crypto
 > backend (as in Buildroot) may be used, leading to linker errors when using
 > esys.

 > Given that tpm2-tss doesn't allow static linking, there is no need to
 > explicitly list the crypto library dependency.

 > Cherry pick an upstream patch to fix this.  Notice that the upstream patch
 > also changes the default crypto backend to openssl.  As this isn't stricly
 > needed (we explicitly configure for openssl) and requires autoreconv, drop
 > the configure.ac hunk from the patch.

 > https://github.com/tpm2-software/tpm2-tss/pull/1173

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
