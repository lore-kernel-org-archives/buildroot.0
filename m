From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 11 Jun 2015 22:16:00 +0200
Subject: [Buildroot] Use an environment variable inside the
	config-5.1.lua
In-Reply-To: <CAHkwnC-ZbMCg=JgwaiL_NqoDeD9-Y3M=DZK2sKBLNFqt1bEHvQ@mail.gmail.com>
References: <CAHkwnC-ZbMCg=JgwaiL_NqoDeD9-Y3M=DZK2sKBLNFqt1bEHvQ@mail.gmail.com>
Message-ID: <CAHkwnC8vP5oo8jdtsZwoRjoesWOAEFCGOd=UtNrKCkZP7hYbmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 9, 2015 at 6:30 AM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> Hi all,
>
> I need to use a linux environment variable inside the "config-5.1.lua"
> to set the "external_deps_dirs", I've used this istruction:
>
> external_deps_dirs = { os.getenv("GCC_SYSROOT") }
>
> but i got this error:
>
> Error running file: [string
> "/home/tetsuya/buildroot/br/output/host/usr/..."]:15: attempt to index
> global 'os' (a nil value)
>
> If i understand correctly the os library cannot be used in the
> "config-5.1.lua" file, there is some way to use it?
>
> Thanks and best regards
> --
> Fabio Porcedda

Hi all,
I answer to my own mail instead of yours because when you replayed I
wasn't subscribed to the mailing list, sorry for the mess.

> Hisham <h@hi...>
>  We could add getenv support in the next release (as usual, patches are welcome).

That would be great!
Unfortunately I don't know the source of luarocks but if i get some
hint maybe i can try to do something.

> In the meantime, Fabio, if you use your $HOME in several machines and
> need config to change dynamically according which one you're logged
> in, you can keep several config-*.lua files in parallel and set
>$LUAROCKS_CONFIG to point to the appropriate config file.
I will try to do that, thanks for the idea.
I need to set a different directory for every package during the build
of the buildroot distribution, this way every app is build in a
controlled environment, just like chroot are used to build
distribution binary packages.

P.S. I've added the buildroot mailing list on CC to let them know
about this effort.

Thanks and Best regards
-- 
Fabio Porcedda
