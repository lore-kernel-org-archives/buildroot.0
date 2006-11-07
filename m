From: Ulf Samuelsson <ulfs@dof.se>
Date: Tue,  7 Nov 2006 09:43:15 +0200
Subject: [Buildroot] Suggestion, Keep version in a separate file.
Message-ID: <byfTFYWKDbpt.qCRz32F5@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
That sounds like it would make the buildroot system overly complicated 
for an rare edge case.
You can do that by managing your .config files - many ways to do that 
already....

=> I really do not see
    how I can, using .config,
    select between 
    package-1.18 and
    package-1.19 unless
    there is support for
    it in the Config.in files.
    (Which there isn't)
    so I have to use two
    different versions of
    buildroot and this is
    making life more 
    complex.

    Anyway, what's so complex
    about adding an extra
    include statement in
    the Makefile?
    
    include $(BR2_VERSION_INFO)

    and set this to ".versions"
    in the main Config.in as
    default.
    If a user wants a different
    set of package versions
    then it is easy to select
    another file.

    By using different .config
    files you easily can maintain different projects using different Version Info files.


    I doubt this is a corner
    case.  Anyone that is supporting more than one
project runs into this problem.



On Nov 6, 2006, at 3:29 PM, Ulf Samuelsson wrote:

>
> I believe it would be a good
> idea to separate the version
> info and download site
> from the <package>.mk.
> and keep a central file
> with this info.
>
> This would make it easier
> to handle several projects
> using different versions
> of packages with the same
> framework.
> As part of this I think patches
> to packages should reside
> in a subdirectory to the
> main package directory.
>
> /Ulf
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
