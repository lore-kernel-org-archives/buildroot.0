From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 14:22:09 +0100
Subject: [Buildroot] [PATCH] libarchive: fix download location
In-Reply-To: <1393506395-15064-1-git-send-email-neumann@teufel.de> (Sven
 Neumann's message of "Thu, 27 Feb 2014 14:06:35 +0100")
References: <1393506395-15064-1-git-send-email-neumann@teufel.de>
Message-ID: <87ppm8adxa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > Signed-off-by: Sven Neumann <neumann@teufel.de>

 > ---
 >  package/libarchive/libarchive.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
 > index 44d9cd2..0b8713f 100644
 > --- a/package/libarchive/libarchive.mk
 > +++ b/package/libarchive/libarchive.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  LIBARCHIVE_VERSION = 3.0.4
 > -LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
 > +LIBARCHIVE_SITE = http://www.libarchive.org/downloads/

Fix in what way? The github URL seems to work for me:

wget http://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz
--2014-02-27 14:21:13--  http://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz
Resolving github.com (github.com)... 192.30.252.131
Connecting to github.com (github.com)|192.30.252.131|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: /downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz [following]
--2014-02-27 14:21:13--  http://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz
Connecting to github.com (github.com)|192.30.252.131|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz [following]
--2014-02-27 14:21:13--  https://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz
Connecting to github.com (github.com)|192.30.252.131|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://cloud.github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz [following]
--2014-02-27 14:21:14--  http://cloud.github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz
Resolving cloud.github.com (cloud.github.com)... 54.230.196.88, 54.230.196.228, 54.230.196.133, ...
Connecting to cloud.github.com (cloud.github.com)|54.230.196.88|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3632806 (3.5M) [application/gzip]
Saving to: ?libarchive-3.0.4.tar.gz?

100%[====================================================================================================================>] 3,632,806   1.16MB/s   in 3.0s   

2014-02-27 14:21:18 (1.16 MB/s) - ?libarchive-3.0.4.tar.gz? saved [3632806/3632806]

-- 
Bye, Peter Korsgaard
