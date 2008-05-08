From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 8 May 2008 16:24:12 -0700
Subject: [Buildroot] ARM build error with llseek.c
In-Reply-To: <1CF6EDDF0820924DA43C9A52FE7325950B4DA9C3@MI8NYCMAIL17.Mi8.com>
References: <326f33790805081549v3afdc776u56cdeb8e57167782@mail.gmail.com>
	<1CF6EDDF0820924DA43C9A52FE7325950B4DA9C3@MI8NYCMAIL17.Mi8.com>
Message-ID: <326f33790805081624g2daf1407v15e8e84ad1914b77@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the information hartleys. Do you know how I can go about defining
_syscall5? Will I need to go into uClibc's menuconfig and select it first?

On Thu, May 8, 2008 at 4:11 PM, hartleys <hartleys@visionengravers.com>
wrote:

>  This is just a guess but...
>
> I'm still using a prebuilt external toolchain and haven't tried building
> one from source yet so I'm not sure how to fix it. But, maybe this
> information to help.
>
> It appears you have a problem with your toolchain. That line in llseek.c
> should be invoving a uClibc macro (_syscall5) but it's not defined so the
> compiler is dying on the syntax of the "function" _syscall.
>
> Just my two cents...
>
>
>  ------------------------------
> *From:* buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org]
> *On Behalf Of *Arun Reddy
> *Sent:* Thursday, May 08, 2008 3:49 PM
> *To:* Buildroot List
> *Subject:* [Buildroot] ARM build error with llseek.c
>
> Hi everyone,
>
> I am continuing with my ARM build and I ran into a problem with llseek.c:
>
> http://img211.imageshack.us/img211/6387/e2fsprogsph4.jpg
>
> I found that this problem was reported before:
> http://bugs.busybox.net/view.php?id=1548
>
> and the solution seemed to involve enabling large file support in
> buildroot's configuration. I did this, but still get the same error. Does
> anyone know why LFS needs to be activated and in my case, why it doesn't
> resolve this issue? Any help on this problem would be appreciated. Thank
> you.
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080508/8b65557a/attachment-0001.htm 
