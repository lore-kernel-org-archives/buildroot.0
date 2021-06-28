From: Andreas Naumann <dev@andin.de>
Date: Mon, 28 Jun 2021 10:27:44 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gesftpserver: Fix
 per-package build without Python
In-Reply-To: <20210626150516.41f5ccd8@windsurf>
References: <20210624123237.23997-1-anaumann@ultratronik.de>
 <20210626150516.41f5ccd8@windsurf>
Message-ID: <ea5727e8-ae1e-ad0e-d4ee-52c44fc510f4@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 26.06.21 15:05, Thomas Petazzoni wrote:
> On Thu, 24 Jun 2021 14:32:37 +0200
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> When building per-package in an environment without Python, the gesftpserver
>> configure script dies when looking for Python support.
>> The configure script is happy (doesnt check and wont error out) when being
>> told that Python is not available, so we hack around this by setting the
>> appropriate env variable.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> 
> Thanks, but the issue is not at all related to per-package. In an
> environment without Python, gesftpserver fails to build, even with
> BR2_PER_PACKAGE_DIRECTORIES disabled.

ahm true. It was just in my defconfig that another package reproducably 
built host-python before gesftpserver. When switching to per-package 
that was no longer the case.

> 
> So I've applied after rewriting the commit log, and adding a comment
> inside the .mk file.

Thanks!
Andreas


> 
> Thanks!
> 
> Thomas
> 
