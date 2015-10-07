From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 7 Oct 2015 11:46:45 -0400
Subject: [Buildroot] [PATCH v3 1/1] yad: new package
In-Reply-To: <5614EF2A.9090809@imgtec.com>
References: <1444076921-6004-1-git-send-email-james.knight@rockwellcollins.com>
 <5614EF2A.9090809@imgtec.com>
Message-ID: <CALe+oY-pnZuJBugebSt6+PXsLJNwCw=Y06xCQgMK9MGyTFCnpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent,

On Wed, Oct 7, 2015 at 6:08 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> In the next line you are going to select BR2_PACKAGE_LIBGLIB2, so you
> need to propagate its dependencies to this package as well. That means
> you need to add right here the following lines:
>
> depends on BR2_USE_WCHAR # libglib2
> depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> depends on BR2_USE_MMU # libglib2

Gotcha. I'll get that fixed.

On this point, is the common practice to copy the `depends` of
packages you `select` on (ex. for this yad package, if I select on
`BR2_PACKAGE_LIBGLIB2`, I then check the libglib2 package and copy the
`depends` references it has and add the command "libglib2" to each
line)?

> The word "from" still fits in the first line as it will not exceed the
> 72 characters limit.

Does it? For myself I have three (3) characters left after "dialogs"
(4+2+69+3). Is a four (4) character tab not the expected length or is
it something else? Curious if I've been messing up all my Config.in
files. :o

>> +
>> +       http://sourceforge.net/projects/yad-dialog/
>> +
>> +comment "yad needs libgtk2 or libgtk3"
>> +     depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3
>
> And you also need to update this comment since now you have the libglib2
> dependencies as well. Something like this would be ok:
>
> comment "yad needs libgtk2 or libgtk3 and a toolchain w/ wchar, threads"
>   depends on BR2_USE_MMU
>   depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>     (!BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3)

Will do. Thanks.

> Be careful if you copy-paste the above text. You have to use tabs for
> indentation instead of spaces :-)

Always paranoid about this; unfortunately my paranoia doesn't catch it
all the time. :(
