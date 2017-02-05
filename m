From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 23:07:11 +0100
Subject: [Buildroot] [PATCH] ruby: bump version to 2.4.0
In-Reply-To: <87fuk0aosw.fsf@dell.be.48ers.dk>
References: <20170109171403.57632-1-Vincent.Riera@imgtec.com>
 <871sw7asxn.fsf@dell.be.48ers.dk> <87lgu24xdi.fsf@dell.be.48ers.dk>
 <r94vldxsb4.ln2@ID-313208.user.individual.net>
 <20170130041946.GJ11210@waldemar-brodkorb.de>
 <87fuk0aosw.fsf@dell.be.48ers.dk>
Message-ID: <20170205230711.6c945266@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jan 2017 10:18:39 +0100, Peter Korsgaard wrote:

> Yes, that might be the way to go. Notice that musl implements isinf /
> isnan as macros, so the detection fails. The reason why it doesn't cause
> linker errors is that include/ruby/missing.h checks if isnan is a macro
> before providing a local declaration:
> 
> #ifndef isnan
> # ifndef HAVE_ISNAN
> RUBY_EXTERN int isnan(double);
> # endif
> #endif
> 
> vs:
> 
> #ifndef HAVE_FINITE
> RUBY_EXTERN int finite(double);
> #endif
> 
> So another solution is to add an #ifndef finite around it. That fix
> could probably be upstreamed as they already do it for a number of other
> functions.

Vicente, since you provided the patch bumping ruby to 2.4.0, could you
provide a patch that fixes the build issues, as suggested by Peter?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
