From: Boris Itkis (Linux) <borisitk@fortunet.com>
Date: Fri, 08 Dec 2006 13:32:35 -0800
Subject: [Buildroot] Problem with building sudo
Message-ID: <4579D9F3.1070400@fortunet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sudu.mk has a problem for building:

$(TARGET_DIR)/usr/bin/sudo

it echo's the command to install sudu instead of running it.

It generally does not stop compile because on distributions like fedora 
because "touch -c" has a exit code of 0 even if the file does no exist.
