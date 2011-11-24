From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 24 Nov 2011 09:15:34 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
Message-ID: <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 23, 2011 at 10:38 PM, Jeff Krasky <jeff.krasky@dspcg.com> wrote:
> According to the documentation for making the .mk file
> (http://buildroot.uclibc.org/buildroot.html#autotools-tutorial), what is the
> syntax for specifying a local (hard drive location) of the .bz2 file?
>
> LIBFOO_SITE = http://www.foosoftware.org/download
>
> Is the example given. ?Can I just do something like
>
> LIBFOO_SITE = /home/libfoo.tar.bz2

You can use

LIBFOO_SITE = file:///home/libfoo.tar.bz2

(note the three slashes; two from the scheme, the third one for an
absolute path)

Note that using file:// will not really help other people, except if
they have access to the same filesystem. You may consider using an
http/ftp server, or an scp url.

Best regards,
Thomas
