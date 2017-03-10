From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Mar 2017 15:27:19 +0000
Subject: [Buildroot] [PATCH] libepoxy: EGL dependency is mandatory
In-Reply-To: <09361e2f-d202-291b-bb56-41b59aca632b@imgtec.com>
References: <20170310111150.9480-1-Vincent.Riera@imgtec.com>
 <20170310160137.6b2c30ef@free-electrons.com>
 <09361e2f-d202-291b-bb56-41b59aca632b@imgtec.com>
Message-ID: <4c43a6e9-633f-a382-b432-0b1fa789e458@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again Thomas,

On 10/03/17 15:05, Vicente Olivert Riera wrote:
> Hi Thomas,
> 
> On 10/03/17 15:01, Thomas Petazzoni wrote:
>> Hello,
>>
>> Cc'ing Gustavo, who said he would have a look at this issue.
> 
> he already was on CC.
> 
>> On Fri, 10 Mar 2017 11:11:50 +0000, Vicente Olivert Riera wrote:
>>> The --disable-egl configure option doesn't exist:
>>>
>>> configure: WARNING: unrecognized options: [snip] --disable-egl
>>>
>>> If you don't have EGL support the configure script will fail like this:
>>>
>>> checking for EGL... no
>>> configure: error: Package requirements (egl) were not met:
>>>
>>> Fixes:
>>>   http://autobuild.buildroot.net/results/3eca5ba26a521f6cc5a611309ba066472af7769c
>>>   http://autobuild.buildroot.net/results/cf9ec7da196d70548ae1413e4a3730314f6434d6
>>>   http://autobuild.buildroot.net/results/069b80101afc4719db6d6d41cf5fc923be21ddc0
>>>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>  package/libepoxy/Config.in   | 6 +++---
>>>  package/libepoxy/libepoxy.mk | 9 +--------
>>>  2 files changed, 4 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
>>> index c87366a..54b8272 100644
>>> --- a/package/libepoxy/Config.in
>>> +++ b/package/libepoxy/Config.in
>>> @@ -1,12 +1,12 @@
>>>  config BR2_PACKAGE_LIBEPOXY
>>>  	bool "libepoxy"
>>>  	select BR2_PACKAGE_XUTIL_UTIL_MACROS
>>> -	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
>>> +	depends on BR2_PACKAGE_HAS_LIBEGL
>>
>> Really egl only is sufficient? This seems dubious. It doesn't need at
>> least OpenGL ES ?
> 
> I have successfully build tested it without Xorg and without OpenGL ES
> support (just OpenGL EGL).

you can try it with this minimal defconfig:

BR2_mips=y
BR2_mips_32r2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_LIBEPOXY=y

Vincent

> 
> Vincent
> 
>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
