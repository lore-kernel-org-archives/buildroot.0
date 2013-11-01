From: Stanislav Vasic <svlasic@gmail.com>
Date: Fri, 1 Nov 2013 20:10:33 +0000 (UTC)
Subject: [Buildroot] iconv: additional encodings
References: <52725222.9050503@gmail.com> <
 CABMiYf_=RK0UJyZLNkW5JU3xSXKMcNxL9-VRxjNpFqtZ3ye50g@mail.gmail.com> <
 0e99777a-09bf-4414-9769-cbfdd10aa040@email.android.com> <52734FA0.3060508@
 gmail.com> <20131101131557.232faaa6@skate> <
 CABMiYf9+4TujbLF8UM7-argbVtmquqgL9we6HRorGEMVA=Qx_w@mail.gmail.com> <
 20131101175255.162ae15b@skate>
Message-ID: <l511rp$p7$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I believe Jan is talking about my patch:

https://github.com/Stane1983/buildroot-mx/
commit/8be22b0db136403ee55c84bf093366808d65dc3f

It works for Linaro toolchains.

In this patch I had to export GCONV_PATH because of XBMC. Otherwise, XBMC 
is not aware of gconv libs existence.

On Fri, 01 Nov 2013 17:52:55 +0100, Thomas Petazzoni wrote:

> Dear Jan Pohanka,
> 
> On Fri, 1 Nov 2013 17:44:31 +0100, Jan Pohanka wrote:
> 
>> I will prepare a patch with this feature. Can you please confirm
>> whether /etc/environment file can be used to set variables for whole
>> system in Busybox? Or it is better to use eg. profile file, etc.
> 
> Why is setting an environment variable necessary? Isn't glibc always
> looking for gconv modules in a standard place, in which we could install
> those modules?
> 
> Thomas
