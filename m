From: Ozgun <ozgun.gunay@gmail.com>
Date: Wed, 15 Feb 2012 19:50:47 +0200
Subject: [Buildroot] opencv with glibc
In-Reply-To: <CAHXCMMKLFopuH8ubCnaY2_1oKkXf-wXHmzV_Fvo77NAutCKOcw@mail.gmail.com>
References: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
 <CAPeX=+ubBEJeR9s+gH8ACDpUToXLA_rDqDwL4NT44BZ-PsfFsA@mail.gmail.com>
 <CAHXCMMKLFopuH8ubCnaY2_1oKkXf-wXHmzV_Fvo77NAutCKOcw@mail.gmail.com>
Message-ID: <CAPeX=+s407S8aNwEZnKD4UAzJjR15-+juPYrJdXR+T4sEg6wEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can compile with glibc library without any problem. But when I choose/add
opencv, buildroot installs CMAKE to TARGET just before opencv and then
CMAKE try to configure opencv, meanwhile CMAKE assumes uclibc.
I changed  CMAKETARGET  to AUTOTARGETS then buildroot give ./configure file
is not exist.
I understand that opencv has a special configuration management system via
CMAKE, and CMAKE has some problems with crosstool-ng toolchain.




On Wed, Feb 15, 2012 at 7:20 PM, Samuel Martin <s.martin49@gmail.com> wrote:

> hi,
>
> Ozgun: you want to use a glibc toolchain, right?
>
> your .config file say that, contrary to your logs:
> >> CMake Error: your CXX compiler:
> >>
> "/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-g++"
> >> was not found.   Please set CMAKE_CXX_COMPILER to a valid compiler path
> or
>
> before changing your configuration to build a ct-ng glibc toolchain,
> did you run 'make clean', 'make distclean' ?
> if yes, then there is a bug in BR that does not delete the
> toolchainfile.cmake when calling clean/distclean target.
>
> btw, removing the buildroot/output/toolchainfile.cmake  and running
> make again should fix your issue.
>
> regards,
>
> Sam
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/c8342df9/attachment.html>
