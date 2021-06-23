From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 11:35:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: Add host-python
 as dependency
In-Reply-To: <87tulp7xz6.fsf@tarshish> (Baruch Siach's message of "Wed, 23 Jun
 2021 12:05:01 +0300")
References: <20210623083634.8158-1-anaumann@ultratronik.de>
 <87tulp7xz6.fsf@tarshish>
Message-ID: <87lf7053fw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Andreas,
 > On Wed, Jun 23 2021, Andreas Naumann wrote:
 >> gesftpserver needs python for the configure step.
 >> 
 >> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
 >> ---
 >> package/gesftpserver/gesftpserver.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
 >> index 85511a3c97..c67fdb3f79 100644
 >> --- a/package/gesftpserver/gesftpserver.mk
 >> +++ b/package/gesftpserver/gesftpserver.mk
 >> @@ -19,7 +19,7 @@ GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
 >> GESFTPSERVER_CONF_ENV = LIBS=-lpthread
 >> 
 >> # overwrite openssh version if enabled
 >> -GESFTPSERVER_DEPENDENCIES += \
 >> +GESFTPSERVER_DEPENDENCIES += host-python \

 > Does host-python3 also work? We would probably drop python2 in the near
 > future.

Exactly. Looking at it, python also only seems to be used for the tests
that we do not need to run, so it is a bit silly to have to pull in
host-python3.

-- 
Bye, Peter Korsgaard
