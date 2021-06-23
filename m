From: Andreas Naumann <dev@andin.de>
Date: Wed, 23 Jun 2021 12:30:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: Add host-python
 as dependency
In-Reply-To: <04d2fb31-bc6c-4811-b8dc-6f9bf992fa95@andin.de>
References: <20210623083634.8158-1-anaumann@ultratronik.de>
 <87tulp7xz6.fsf@tarshish> <87lf7053fw.fsf@dell.be.48ers.dk>
 <04d2fb31-bc6c-4811-b8dc-6f9bf992fa95@andin.de>
Message-ID: <557bdc53-6245-0d80-9a2e-0ed0187abb3a@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On 23.06.21 12:00, Andreas Naumann wrote:
> Hi,
> 
> On 23.06.21 11:35, Peter Korsgaard wrote:
>>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>>
>> ? > Hi Andreas,
>> ? > On Wed, Jun 23 2021, Andreas Naumann wrote:
>> ? >> gesftpserver needs python for the configure step.
>> ? >>
>> ? >> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> ? >> ---
>> ? >> package/gesftpserver/gesftpserver.mk | 2 +-
>> ? >> 1 file changed, 1 insertion(+), 1 deletion(-)
>> ? >>
>> ? >> diff --git a/package/gesftpserver/gesftpserver.mk 
>> b/package/gesftpserver/gesftpserver.mk
>> ? >> index 85511a3c97..c67fdb3f79 100644
>> ? >> --- a/package/gesftpserver/gesftpserver.mk
>> ? >> +++ b/package/gesftpserver/gesftpserver.mk
>> ? >> @@ -19,7 +19,7 @@ GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
>> ? >> GESFTPSERVER_CONF_ENV = LIBS=-lpthread
>> ? >>
>> ? >> # overwrite openssh version if enabled
>> ? >> -GESFTPSERVER_DEPENDENCIES += \
>> ? >> +GESFTPSERVER_DEPENDENCIES += host-python \
>>
>> ? > Does host-python3 also work? We would probably drop python2 in the 
>> near
>> ? > future.
> 
> So I just tried and yes, host-python3 does the job.
> 
>>
>> Exactly. Looking at it, python also only seems to be used for the tests
>> that we do not need to run, so it is a bit silly to have to pull in
>> host-python3.
> 
> Ok, i didnt look why Python is needed. Also, I never saw the problem 
> until using per-package build. So buildtime-wise it's not a problem in 
> my case because we pull in host-python for some other package anyway.
> 
> I will check if I can get rid of the tests though.

... The configure script does not provide an option to skip test, so I 
could patch the configure script or somehow fake that python is there 
even if it doesnt. Both solutions seem not very elegant to so if you 
agree I'd just repost the patch with host-python3 as dependency.

regards,
Andreas

> 
> regards,
> Andreas
> 
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
