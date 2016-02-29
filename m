From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Mon, 29 Feb 2016 09:16:53 +0100
Subject: [Buildroot] [dropbear] fail ssh conection with Passwords
	encoding SHA-256 or SHA-512
In-Reply-To: <87h9gvv64e.fsf@dell.be.48ers.dk>
References: <CALtfCQbqTNvokwneH9uFFESNFK6_HZWKy19oefELL4OgDw-jpw@mail.gmail.com>
 <87h9gvv64e.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQaWrdA5Mr2xH28Q=BctyzZNKpoR_65RMc5Hb5j6H0Lmag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Your proposal works perfectly.

Thank you very much.

Oscar Gomez Fuente

On 26 February 2016 at 16:33, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi,
>  > I'm new in buldroot and I'm building a raspberry 2 platform. I've based
> on
>  > raspberrypi2_defconfig configuration. But I've changed two things:
>
>  > 1?.- I've added dropbear to add ssh functionality.
>
>  > Everything works fine and I can connect to my raspberry by ssh (System
>  > password encoding md5). The problem is when I've changed the password
>  > encoding from md5 to SHA-256 or SHA-512. When I've tried to make an ssh
>  > conection from a PC to my raspberry pi 2 the access fail:
>
>  > root at 192.168.10.105's password:
>  > Permission denied, please try again.
>
> The problem is that uClibc doesn't have support for the sha256/512
> ciphers by default, so dropbear cannot authenticate you. It happens to
> work when you login through serial as the busybox login program uses
> built in password handling functions (and we have code to enable the
> sha256/512 routines when enabled in buildroot).
>
> I guess we need to do the same for uClibc (or just unconditionally
> enable it). In the mean time you can use glibc instead which does
> support it (make sure you do a clean build whenever you change toolchain
> options).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160229/e181f69b/attachment.html>
