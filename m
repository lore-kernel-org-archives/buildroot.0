From: Mitch Davis <mjd+buildroot@afork.com>
Date: Mon, 5 Jul 2010 08:52:07 +1000
Subject: [Buildroot] QSound
In-Reply-To: <AANLkTimNs2jP4EzQhA7XwVVXvXaRTI-FhTbKvnxgqSuj@mail.gmail.com>
References: <AANLkTimNs2jP4EzQhA7XwVVXvXaRTI-FhTbKvnxgqSuj@mail.gmail.com>
Message-ID: <AANLkTilC893gbFTpH0WQJDqZoV82oAHG_Nb5D5xWGF7c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 4, 2010 at 9:29 PM, Mahmoud Mamdouh
<mamdouh.al.shamy@gmail.com> wrote:
> i made OS with buildroot with busybox with Qt
>
> and trying Opening app with QSound
>
> put i get
> "
>
> can't load library 'libQtMultimedia.so.4

Mahmoud,

Here are some thoughts on how to find what is causing the problem.

Do you have that library on your target?

Can you please run "ldd yourapp"?  Can it find that library?  Is the
LD_LIBRARY_PATH environment variable set?  Can you look in /lib,
/usr/lib and the directories in LD_LIBRARY_PATH for that library?

If you don't find that library, you have to find out why it's not there.

When you type "make" for buildroot, you get output telling you what
gets compiled.  If you start with a fresh compile, and save that
output, and search for libQtMultimedia, can you see where it gets
installed?

If not, maybe it's not being installed.  Why?  Do some grepping
through package/ (and its subdirs), and see if you can find which
package provides that library.  Is that package being built?  What's
the config var in your buildroot .config file for that package?  Is it
set?

> plz help

The more info you can give us (for example, what you've tried, and
screen outputs and /var/log/messages), the easier it is for us to help
you.  Please remember that.  You can put large listings on a site such
as http://pastebin.org/

Mitch.
