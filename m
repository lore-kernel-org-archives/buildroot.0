From: Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Mon, 21 Jul 2014 16:55:43 -0300
Subject: [Buildroot] [PATCH] u-boot: Allow to specify a list of patches
In-Reply-To: <53C85A27.2060907@mind.be>
References: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140715205341.77237719@free-electrons.com>
 <CAAEAJfB7bjvsdGCOc+5Rzt39ERfvfC=sSYKtKUtGwDLXiBDLdA@mail.gmail.com>
 <20140715201336.GE3351@free.fr> <53C6FB6D.2040903@mind.be>
 <29128166-5526-4da5-804d-72225bc05bc1@email.android.com>
 <53C77FC8.6060303@mind.be> <20140717172331.GD3737@free.fr>
 <53C85A27.2060907@mind.be>
Message-ID: <20140721195543.GA23072@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

On 18 Jul 01:20 AM, Arnout Vandecappelle wrote:
[..]
> >>>>>
> >>>>> Thomas, was there a specific reason we wanted the patches to be
> >>>>> PKG-prefixed? If not, would it make sense to just accept patches without
> >>>>> a PKG-prefix?
> >>>>
> >>>> Er, we don't... We require this specific naming scheme for contributed
> >>>> packages, but the code itself just takes *.patch.
> >>>
> >>> Yes sure, it's a convention only, but the question is: why did we include the package name in the convention?
> >>
> >>  I think it's purely historical. And I think it never was required for patches
> >> in a <pkgname> subdir.
> > 
> > So we could change the manual to not require patches to be PKG-prefixed?
> > 
> > As long as they are number-prefixed, that's all we need, right?
> > 
> > So, Ezequiel's patch is really no longer needed, and his use-case to use
> > git-formatted patches is already covered, right?
> 
>  Yep.
> 
>  Untested, of course :-)
> 

I did a quick test in here. It seems GLOBAL_PATCH_DIR works perfectly,
and it's a lot cleaner than having N options, one for each supposedly special
package, as it's keeps all the modification to vanilla in one place.

So I strongly support removing all the UBOOT_PATCH, LINUX_PATCH, and any other
FOO_PATCH options out there.

Any brave hacker stepping up? :)
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
