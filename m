From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 01 Apr 2015 23:07:42 +0200
Subject: [Buildroot] clapack libraries missing?: buildroot-2014.11
In-Reply-To: <8328b17ed1d642209ea7133d18709de1@exch13-mail05.win.slac.stanford.edu>
References: <CADDnATcLG1SbgVZ8TB08J_yHU5vF7vKTPdwUZnFvcgewoUFdEg@mail.gmail.com>,
 <551AFE63.6050009@mind.be>,
 <8b612d402130471485daafdd832b2d6a@exch13-mail05.win.slac.stanford.edu>
 <8328b17ed1d642209ea7133d18709de1@exch13-mail05.win.slac.stanford.edu>
Message-ID: <551C5E1E.4090303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Ernesto, any chance of configuring your mailer to do proper quoting?]

On 01/04/15 07:05, Williams Jr., Ernest L. wrote:
[snip]
> My code does not compile:
> clapack has types that are not defined :(
> 
> What other header file defines, "integer, "complex", "doublereal", "logical" , etc  ...?
> 
> /* header file for clapack 3.2.1 */
> 
> #ifndef __CLAPACK_H
> #define __CLAPACK_H
> 
> /* Subroutine */ int caxpy_(integer *n, complex *ca, complex *cx, integer *
>         incx, complex *cy, integer *incy);
> 
> 
> 
> Looks like  "f2c.h" is actually needed but was not installed.

 Could you find out from upstream how to make sure that f2c gets installed as
well? Perhaps also ask them to include f2c.h from clapack.h.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
