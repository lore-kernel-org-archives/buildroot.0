From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 01 Nov 2014 21:16:25 -0300
Subject: [Buildroot] Samba4 build issue
In-Reply-To: <20141101233957.7ca9aabd@free-electrons.com>
References: <20141101233957.7ca9aabd@free-electrons.com>
Message-ID: <545577D9.1040405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/2014 07:39 PM, Thomas Petazzoni wrote:

> Hello Gustavo,
> 
> A build issue is affecting Samba 4, apparently on many
> architectures/toolchains:
> 
>    http://autobuild.buildroot.org/?reason=samba4-4.1.13
> 
> The error message seems to be more or less always the same:
> 
> /home/peko/autobuild/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/xattr.h:32:3: error: expected identifier before numeric constant
>    XATTR_CREATE = 1, /* set value, fail if attr already exists.  */
>    ^
> 
> Is this some new kernel headers dependency? Dependency on the attr
> package?
> 
> If you could have a look, it would be great.

No, it's a bump from an autodep that's breaking havoc.
Blame 57280c2f244500ac6616377b3b8eab458c1ead23.
The release is all kinds of wrong apparently, even 2.23 breaks and more
horribly than 2.24.
So let's just roll back to 2.22 until a detailed analysis can take place
to fix it.
Regards.
