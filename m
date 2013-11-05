From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 00:21:01 +0100
Subject: [Buildroot] [PATCH 1/1] sqlcipher: fix download url
In-Reply-To: <1383692357-1519-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Tue, 5 Nov 2013 23:59:17 +0100")
References: <1383692357-1519-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87li12mo4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Fix in what way?

wget http://github.com/sqlcipher/sqlcipher/tarball/v1.1.9/sqlcipher-v1.1.9.tar.gz
--2013-11-06 00:17:11--  http://github.com/sqlcipher/sqlcipher/tarball/v1.1.9/sqlcipher-v1.1.9.tar.gz
Resolving github.com (github.com)... 192.30.252.128
Connecting to github.com (github.com)|192.30.252.128|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/sqlcipher/sqlcipher/tarball/v1.1.9/sqlcipher-v1.1.9.tar.gz [following]
--2013-11-06 00:17:11--  https://github.com/sqlcipher/sqlcipher/tarball/v1.1.9/sqlcipher-v1.1.9.tar.gz
Connecting to github.com (github.com)|192.30.252.128|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/sqlcipher/sqlcipher/legacy.tar.gz/v1.1.9 [following]
--2013-11-06 00:17:12--  https://codeload.github.com/sqlcipher/sqlcipher/legacy.tar.gz/v1.1.9
Resolving codeload.github.com (codeload.github.com)... 192.30.252.145
Connecting to codeload.github.com (codeload.github.com)|192.30.252.145|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: `sqlcipher-v1.1.9.tar.gz'

wget http://github.com/sqlcipher/sqlcipher/archive/v1.1.9/sqlcipher-v1.1.9.tar.gz                                                                                                                                      /tmp
--2013-11-06 00:18:32--  http://github.com/sqlcipher/sqlcipher/archive/v1.1.9/sqlcipher-v1.1.9.tar.gz
Resolving github.com (github.com)... 192.30.252.128
Connecting to github.com (github.com)|192.30.252.128|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/sqlcipher/sqlcipher/archive/v1.1.9/sqlcipher-v1.1.9.tar.gz [following]
--2013-11-06 00:18:32--  https://github.com/sqlcipher/sqlcipher/archive/v1.1.9/sqlcipher-v1.1.9.tar.gz
Connecting to github.com (github.com)|192.30.252.128|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/sqlcipher/sqlcipher/tar.gz/v1.1.9 [following]
--2013-11-06 00:18:33--  https://codeload.github.com/sqlcipher/sqlcipher/tar.gz/v1.1.9
Resolving codeload.github.com (codeload.github.com)... 192.30.252.146
Connecting to codeload.github.com (codeload.github.com)|192.30.252.146|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4032588 (3.8M) [application/x-gzip]
Saving to: `sqlcipher-v1.1.9.tar.gz.1'

So both works. We seem to mainly use the tarball version:

git grep 'github.*tarball' package | wc -l
44

git grep 'github.*archive' package | wc -l
4


 > ---
 >  package/sqlcipher/sqlcipher.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
 > index 3ade403..e93d24d 100644
 > --- a/package/sqlcipher/sqlcipher.mk
 > +++ b/package/sqlcipher/sqlcipher.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  SQLCIPHER_VERSION = v1.1.9
 > -SQLCIPHER_SITE = http://github.com/sjlombardo/sqlcipher/tarball/$(SQLCIPHER_VERSION)
 > +SQLCIPHER_SITE = http://github.com/sqlcipher/sqlcipher/archive/$(SQLCIPHER_VERSION)
 >  SQLCIPHER_DEPENDENCIES = openssl host-tcl
 >  SQLCIPHER_INSTALL_STAGING = YES
 
 > -- 
 > 1.8.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
