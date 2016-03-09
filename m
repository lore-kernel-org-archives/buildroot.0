From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 07:31:56 +0100
Subject: [Buildroot] [PATCH v2] libpjsip: depend on libsrtp
In-Reply-To: <1457478401-24164-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 9 Mar 2016 00:06:41 +0100")
References: <1457478401-24164-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87pov42mcj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > libpjsip needs libsrtp to build, but it bundles a libsrtp version in
 > case one is not found during the configure step. The Buildroot policy
 > in such cases is to force using the external package, so forcibly
 > depend on libsrtp.

 > Adding --with-external-srtp also fixes libpjsip not correctly the
 > libsrtp installed in staging, which shows up with the symptom:

 >   .../libpjmedia.so: undefined reference to `srtp_deinit'
 >   collect2: error: ld returned 1 exit status

 > Fixes:
 >   http://autobuild.buildroot.org/results/305/305fdc8442cd2e8f51b90485be0dca83ffa36603/
 >   http://autobuild.buildroot.org/results/a2f/a2f407c1361ac5c24af122445e84645e9aee309d/
 >   ...and many other similar autobuild failures.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
