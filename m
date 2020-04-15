From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 15 Apr 2020 11:33:04 -0400
Subject: [Buildroot] A graphical build monitor for Buildroot
Message-ID: <CAB4xu_0G4_2uBeT0aXnHhHwHqSj8Ch2mye70u3miRBSZB5D9Fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildroot users!

I made a graphical Buildroot build monitor and thought I'd share it
here.

Project's page: <https://github.com/eepp/yobr>.

It's pretty simple to install and use:

1. Install pip for Python 3 (`python3-pip` package on most distros).

2. Install `yobr`:

       $ sudo pip3 install yobr

   `pip3` can also install locally:

       $ pip3 install --user yobr

3. Start `yobr`:

       $ yobr /path/to/buildroot

`yobr` works with Buildroot 2019.08 and up.

When `yobr` starts, it uses Buildroot's `make show-info` to get package
information and then polls package build stamp files to update its view.

Unfortunately it's hard to use `yobr` for a remote build without X11
forwarding. The SSHFS approach is just too slow considering how
Buildroot works. I might come up with an ncurses equivalent one day
which would address this use case.

Phil
