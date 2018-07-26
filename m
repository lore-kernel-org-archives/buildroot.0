From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 26 Jul 2018 15:54:01 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <20180726154223.390beed1@windsurf>
References: <20180726131023.28695-1-m.niestroj@grinn-global.com>
 <20180726154223.390beed1@windsurf>
Message-ID: <687061ac-983c-b700-615f-227b13094489@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 26.07.2018 15:42, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for this new iteration.
> 
> On Thu, 26 Jul 2018 15:10:22 +0200, Marcin Niestroj wrote:
> 
>> + configure                 | 32 ++++++++++++++++++++++++++++++--
> 
> I missed that in the review of the previous version. Is there a reason
> to patch the configure script itself? In Buildroot, our general rule is
> to not patch configure, but instead patch configure.ac and use
> <pkg>_AUTORECONF = YES to regenerate the configure script.
> 
> Is there a reason to not follow this rule in this specific situation ?

I've prepared this patch to go to lvm2 upstream. I looked at other
commits, they also included changes in 'configure' script.

I agree, that this is not necessary with Buildroot. But we have to
choose between:
1) keep 'configure' changes in Buildroot lvm2 patch, so we have
    nearly the same patch as posted upstream
2) remove 'configure' changes, so we make the lvm2 patch smaller
    and cleaner.

Choice is up to you :)

Regards,
Marcin

> 
> Thanks!
> 
> Thomas
> 
