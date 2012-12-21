From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Dec 2012 20:43:48 +0000 (UTC)
Subject: [Buildroot] [Bug 5810] Buildroot 2012.11: Additional GCC option
 "-msoft-float" breaks the build
In-Reply-To: <bug-5810-163@https.bugs.busybox.net/>
References: <bug-5810-163@https.bugs.busybox.net/>
Message-ID: <20121221204348.3AEC29A403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5810

--- Comment #5 from Timofei Bolshakov <tbolsh@gmail.com> 2012-12-21 20:44:10 UTC ---
(In reply to comment #4)
> So, you're explicitly passing:
> 
> BR2_EXTRA_GCC_CONFIG_OPTIONS="-msoft-float"

No, I am setting "Additional gcc options". That leads to 
BR2_EXTRA_GCC_CONFIG_OPTIONS="-msoft-float"
I surely was not understanding that it will lead to CONFIG option. 
My fault. But that is curious conversion from "Additional gcc options" to 
BR2_EXTRA_GCC_CONFIG_OPTIONS - it is not clear until one goes into 
the .config in text form. Meanwhile - using it in "Target optimizations" also 
leads to break. 

And that was not breaking the build in 2012.8

So, where should I put my -msoft-float then? I want everything to be compiled 
with this flag.

> 
> in your Buildroot configuration, and then you complain because GCC doesn't
> understand your special flag? 

What should I complain about then? Unclear language?
If one will change "Additional gcc options" to "Additional gcc config options"
there will be no confusion. Or to use anything I should go and check the source
code? 

> If you pass a special flag, aren't you supposed
> to know what you're doing?
> 
> This seems like a curious bug report, isn't it ?

That is clear enough:

-msoft-float
           Use (do not use) the hardware floating-point instructions for
floating-point operations.  When -msoft-float is specified, functions in
libgcc.a will be used to perform floating-point operations. Unless they are
replaced by routines that emulate the floating-point operations, or compiled in
such a way as to call such emulations routines, these routines will issue
floating-point operations. If you are compiling for an Alpha without
floating-point operations, you must ensure that the library is built so as not
to call them. Note that Alpha implementations without floating-point operations
are required to have floating-point registers.

That is what I want - "functions in libgcc.a will be used to perform
floating-point operations". I was wrong to use config option labelled as
"additional" for that. Where can I put my "-msoft-float"?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
