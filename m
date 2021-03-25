From: Alassane <alassaneg@gmail.com>
Date: Thu, 25 Mar 2021 23:41:40 +0100
Subject: [Buildroot] PHP installation issues
In-Reply-To: <20210325232828.29fee700@gmx.net>
References: <CAJ2YAHtdmiVyOZJNZbaWpGon15hznYV815QAhgKe4KY7YBBdmQ@mail.gmail.com>
 <20210325232828.29fee700@gmx.net>
Message-ID: <CAJ2YAHu17z6PjRxObJGtoTTndySx-qjjiOwfiOEuzLE7jAJw=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thank for your answer.
i've added "extension=imagick.so" in the file /etc/php.ini and i'm now able
to use imagick. That was a tricky one...
Regarding the "iconv()" function, the issue was that i had to select the
option "extra encodings" when selecting libiconv.

kind regards

Le jeu. 25 mars 2021 ? 23:28, Peter Seiderer <ps.report@gmx.net> a ?crit :

> Hello Alassane,
>
> On Mon, 22 Mar 2021 15:13:47 +0100, Alassane <alassaneg@gmail.com> wrote:
>
> > Hello,
> >
> > I have tried to generate a linux image with buildroot2020.11.1 but i'm
> > having some issues after that.
> > First of all, i've activated the external php extension "php-imagick" in
> > target package after i run "make menuconfig".
> > After that, i perform a full rebuild, reflash my sd card, launch my
> target
> > but when i run the commande "php -m", it doesn't show me the "imagick"
> > module...
> > And this is the following error message i'm facing when trying to run a
> > program with the "php" command : *PHP Fatal error:  Uncaught Error: Class
> > 'Imagick' not found*
> >
> > Also, i've selected the php "iconv" package and facing this error when i
> > try to run my php program : *PHP Notice:  iconv(): Unknown error (22).*
>
> Strace output shows:
>
> 235   openat(AT_FDCWD, "/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) =
> -1 ENOENT (No such file or directory)
> 235   openat(AT_FDCWD, "/usr/lib64/gconv/gconv-modules",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> 235   futex(0x7fb0b76864, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> 235   write(2, "PHP Notice:  iconv(): Unknown er"..., 69) = 69
>
> Take a look at the Toolchain --> Copy gconv libraries
> (BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY)...
>
> Regards,
> Peter
>
> >
> > Do you know where these issues i'm facing could potentially come from?
> >
> > Kind regards
> >
> > Thank you
> >
> > Alassane
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210325/eb1f056d/attachment.html>
