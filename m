From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jun 2015 22:32:49 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <339271dfef37197a3b13ecbd8222c28a@openmailbox.org>
References: <1433882623-15782-1-git-send-email-cedric.marie@openmailbox.org>	<5578AFEC.4020107@mind.be>
 <339271dfef37197a3b13ecbd8222c28a@openmailbox.org>
Message-ID: <5579F071.40802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/15 14:58, C?dric Marie wrote:
> Hi,
> 
> Le 2015-06-10 23:45, Arnout Vandecappelle a ?crit :
>>  I think the explanation you gave in your first mail would be valuable here.
> 
> OK. I didn't want to give too much details in the end, but you're right.
> 
> 
>> Certainly, the fact that the target installation path is suffixed with -pure
>> should be clarified.
>>
>>  Do all the packages that depend on directfb still build correctly with this
>> -pure suffix?
> 
> The public library is not moved: /usr/lib/libdirectfb.so
> Only internal libraries are placed in a different directory:
> /usr/lib/directfb-x.y.z-pure/
> It contains following directories: gfxdrivers, inputdrivers, interfaces,
> systems, wm.
> It makes no difference for applications using DFB.
> 
> 
> Would you be satisfied with that description below, as a commit message?

 Yes, but I was in fact mainly talking about the help text of the new option.

 Regards,
 Arnout

> 
> 
> DirectFB provides two options for debug:
> * --enable-debug-support (default is yes)
> * --enable-debug (default is no)
> The first one provides the functions to print debug information. These
> functions can be called inside DirectFB, or by an external DirectFB
> driver in another package.
> The second one enables verbose mode in DirectFB, using these functions.
> 
> Buildroot currently provides an option for the second one only. The
> first one - which is necessary for the second one - is always enabled,
> because this is the default value.
> 
> The new option (BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT) makes it possible
> to disable debugging support (--disable-debug-support) in order to
> build the library with no debug feature at all.
> 
> When debugging support is disabled, the target installation path of
> internal libraries (/usr/lib/directfb-<version>) is suffixed with
> -pure. The public library (/usr/lib/libdirectfb.so) remains unchanged.
> 
> Some external DirectFB drivers will install in
> /usr/lib/directfb-<version>-pure in release mode. For that reason, it
> is important that DirectFB can be configured to use this directory.
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
