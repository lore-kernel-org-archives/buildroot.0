From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Mar 2014 08:46:23 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-triggerd: new package
In-Reply-To: <53327B4B.2010005@syscom.ch>
References: <1395734396-31668-1-git-send-email-rebillout@syscom.ch>
 <1395734396-31668-2-git-send-email-rebillout@syscom.ch>
 <5331E316.4030706@mind.be> <53327B4B.2010005@syscom.ch>
Message-ID: <533285CF.6090700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/03/14 08:01, Arnaud R?billout wrote:
> Hi Arnout,
> 
>>  For the other dbus-* packages, the dbus dependencies are repeated (even
>> though they're automatic because of the depends on DBUS). So I would do
>> that here as well. And that means of course that there should also be a
>> comment in case of missing toolchain features. See dbus-cpp for an example.
> You're right, I forgot the comments, and the host-pkgconf dependency as well.
> I will do as you suggest for the DBUS dependencies.
> 
>>  Patch misses a description + Signed-off-by.
> Correct.
> 
>>  If you're anyway patching the Makefile, you can just as well make it:
>>
>> CFLAGS?=-Wall -O3
>> CFLAGS+=`$(PKG_CONFIG) --cflags dbus-1`
>> LDLIBS+=`$(PKG_CONFIG) --libs dbus-1`
>>
>>
>>
>>  Will you send this patch upstream?
> Yep. I will send a patch right now.
> 
> 
>>  This should be $(TARGET_CONFIGURE_OPTS) which includes all of the above
>> and more.
> OK. Actually, I've always been wondering it was OK to use
> TARGET_CONFIGURE_OPTS in a generic package, I never dared to do it.

 Yeah, it should be renamed, really.

 Regards,
 Arnout

> 
>>  Note BTW that the patch above refers to LDLIBS instead of LDFLAGS. Is
>> LDFLAGS used?
> Yep, LDFLAGS is used automatically by Make in this Makefile.
> 
> 
> 
> Thanks for your comments, I will send the patch upstream a wait a little
> for the author's comments on it.
> 
> 
> Regards
> 
> 
> -- 
> Arnaud R?billout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
