From: renxuefeng <renxf_maillist@126.com>
Date: Tue, 10 Oct 2006 22:02:15 +0800
Subject: [Buildroot] How can i compile bash3.1 with uclibc
In-Reply-To: <901e5e350610100506t1574b963u5dcf77b34a9967ad@mail.gmail.com>
References: <452B7C1B.1020809@126.com>
	<901e5e350610100506t1574b963u5dcf77b34a9967ad@mail.gmail.com>
Message-ID: <452BA7E7.9060704@126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Michael.
I have done using  your method. Now I can compile the bash sucessfully.
but i don't know whether there will be some problem. I know fork and 
vfork have some differences.
> You should add the following option to gcc
>
> CFLAGS += -Dfork=vfork
>
> On 10/10/06, *renxuefeng* <renxf_maillist@126.com 
> <mailto:renxf_maillist@126.com>> wrote:
>
>     i met a problem When i build buildroot with uclibc.
>     while compiling the bash3.1, it showed some error:
>
>     nojobs.o: In function `make_child':
>     nojobs.c:(.text+0x464): undefined reference to `fork'
>
>     I thought this is because the uclibc didnot support the fork function
>     under the armnommu platform
>     but how can i using bash under uclibc.
>     does anybody have some patch for this problem.
>
>
>
>
>     _______________________________________________
>     buildroot mailing list
>     buildroot at uclibc.org <mailto:buildroot@uclibc.org>
>     http://busybox.net/mailman/listinfo/buildroot
>
>
