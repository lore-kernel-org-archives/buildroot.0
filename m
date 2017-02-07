From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 15:29:41 +0100
Subject: [Buildroot] [V2 1/1] ntp: security bump to verserion 4.2.8p9
In-Reply-To: <20170206141225.2311-1-aduskett@codeblue.com> (Adam Duskett's
 message of "Mon, 6 Feb 2017 09:12:25 -0500")
References: <20170206141225.2311-1-aduskett@codeblue.com>
Message-ID: <874m06rs4q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > This version of ntp fixes several vulnerabilities.
 > CVE-2016-9311
 > CVE-2016-9310
 > CVE-2016-7427
 > CVE-2016-7428
 > CVE-2016-9312
 > CVE-2016-7431
 > CVE-2016-7434
 > CVE-2016-7429
 > CVE-2016-7426
 > CVE-2016-7433

 > http://www.kb.cert.org/vuls/id/633847

 > In addition, libssl_compat.h is now included in many files, which
 > references openssl/evp.h, openssl/dsa.h, and openssl/rsa.h.
 > Even if a you pass --disable-ssl as a configuration option, these
 > files are now required.

 > As such, I have also added openssl as a dependency, and it is now
 > automatically selected when you select ntp.

 > Signed-off-by: Adam Duskett <aduskett@codeblue.com>
 > ---
 > v1 -> v2:
 >   - Changed subject to indicate a security bump. (suggested by Baruch)
 >   - Removed check to see if openssl is enabled (suggested by Baruch)
 >   - Added the option --with-crypto to the configuration options by default. 

It's a bit of a pain that openssl no longer is optional, but fixing that
seems to be nontrivial. Committed, thanks.

-- 
Bye, Peter Korsgaard
