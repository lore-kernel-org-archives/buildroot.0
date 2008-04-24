From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 14:11:26 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/java: classpath
	concierge jamvm
In-Reply-To: <874p9r408c.fsf@macbook.be.48ers.dk>
References: <20080424164821.800223C7C2@busybox.net>
	<874p9r408c.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670804241111j3548905fn3ca6f80b56e92dcf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't even see where JAMVM_DIR_PREFIX is being used at all. I'm removing
it.

John


On Thu, Apr 24, 2008 at 1:43 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:
>
> Hi,
>
>  ninevoltz> Author: ninevoltz
>  ninevoltz> Date: 2008-04-24 09:48:20 -0700 (Thu, 24 Apr 2008)
>  ninevoltz> New Revision: 21845
>
>  ninevoltz> Log:
>  ninevoltz> bump to 0.97.1, removed patch as it has been already applied in
> upstream revision 0.97.0 (
> http://gcc.gnu.org/bugzilla/buglist.cgi?product=classpath&target_milestone=0.97
> )
>  ninevoltz> also fix change in package path that prevented patches from
> being applied
>
> Thanks.
>
>  ninevoltz> +JAMVM_DIR_PREFIX = package/java
>
>  ninevoltz> -$(eval $(call AUTOTARGETS,package,jamvm))
>  ninevoltz> +$(eval $(call AUTOTARGETS,package/java,jamvm))
>
> Wouldn't it make sense for <package>_DIR_PREFIX to default to the 1st
> argument of AUTOTARGETS?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/a907fa81/attachment.htm 
