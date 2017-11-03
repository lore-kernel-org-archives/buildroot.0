From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 14:38:28 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <CA+TH9Vkq1oPHSwTTJTzr4MdVRo6=zWMgG5pLKTsf3-ZAwhNKjw@mail.gmail.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <20171102232155.11995715@windsurf>
 <CA+TH9Vkq1oPHSwTTJTzr4MdVRo6=zWMgG5pLKTsf3-ZAwhNKjw@mail.gmail.com>
Message-ID: <20171103143828.4f57ab67@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Nov 2017 12:17:37 +0100, Angelo Compagnucci wrote:

> >> Unhandled Exception:
> >> System.ExecutionEngineException: System.NullReferenceException: Object reference not set to an instance of an object ---> System.NullReferenceException: Object reference not set to an instance of an object
> >>
> >> Angelo, could you have a look ?  
> >
> > Still unfixed.  
> 
> Unfortunately I cannot reproduce the problem. Could be something
> transient? It has not crashed anymore in the last few days.

No, it's not a transient issue, as I've been able to reproduce a
similar (but not identical) crash. The thing is that it fails when
building on a ppc64le machine (the gcc112 autobuilder instance). I just
reproduced it:

Unhandled Exception:
System.ExecutionEngineException: System.IndexOutOfRangeException: Index was outside the bounds of the array. ---> System.IndexOutOfRangeException: Index was outside the bounds of the array.
   --- End of inner exception stack trace ---
[...]

So it seems like host-mono doesn't build on a ppc64le machine. Looking
at the host-monolite tarball, I see it's a bunch of .dll built for x86.
Is this supposed to work on other architectures as well?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
