From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Mon, 21 Jan 2013 15:38:41 +1100
Subject: [Buildroot] Default target file system permissions
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A3C@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a question regarding the default permissions files receive on the
target file system. The issue arises specifically if the host build
system uses a umask that leads to undesirable permissions on the target.

What I've done in the past is use a wrapper shell, that sets the umask
correctly and then calls bash, to replace the SHELL variable in the root
Makefile. This seems like a bit of a hack and I'm sure there must be a
better way to do it I'm not aware of. Now that each package has its own
device_table.txt this seems like it might be one good way, but the
makedev utility doesn't support setting permission recursively as far as
I can tell. Is there a better way to do this?

Cheers,
Przemyslaw Wrzos
