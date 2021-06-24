From: Andreas Naumann <dev@andin.de>
Date: Thu, 24 Jun 2021 14:34:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: Add host-python
 as dependency
In-Reply-To: <87h7ho4xfh.fsf@dell.be.48ers.dk>
References: <20210623083634.8158-1-anaumann@ultratronik.de>
 <87tulp7xz6.fsf@tarshish> <87lf7053fw.fsf@dell.be.48ers.dk>
 <04d2fb31-bc6c-4811-b8dc-6f9bf992fa95@andin.de>
 <557bdc53-6245-0d80-9a2e-0ed0187abb3a@andin.de>
 <87h7ho4xfh.fsf@dell.be.48ers.dk>
Message-ID: <5b24a0cc-e788-4d49-af73-69cb177d58a0@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 23.06.21 13:45, Peter Korsgaard wrote:
>>>>>> "Andreas" == Andreas Naumann <dev@andin.de> writes:
> 
> Hi,
> 
>   >> Ok, i didnt look why Python is needed. Also, I never saw the problem
>   >> until using per-package build. So buildtime-wise it's not a problem
>   >> in my case because we pull in host-python for some other package
>   >> anyway.
>   >>
>   >> I will check if I can get rid of the tests though.
> 
>   > ... The configure script does not provide an option to skip test, so I
>   > could patch the configure script or somehow fake that python is there
>   > even if it doesnt. Both solutions seem not very elegant to so if you
>   > agree I'd just repost the patch with host-python3 as dependency.
> 
> A simple hack would just to pass rjk_cv_python24=true in
> GESFTPSERVER_CONF_ENV.

just send v2 with your suggestion, but slightly altered because telling 
configure that Python is not there also works.

regards,
Andreas

> 
> The tests themselves are afaik only executed if you run 'make check'
> (which we don't).
> 
