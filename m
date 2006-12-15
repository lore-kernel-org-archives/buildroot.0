From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 15 Dec 2006 16:10:39 +0100
Subject: [Buildroot] Problem with building sudo
In-Reply-To: <4579D9F3.1070400@fortunet.com>
References: <4579D9F3.1070400@fortunet.com>
Message-ID: <20061215151039.GA14633@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 08, 2006 at 01:32:35PM -0800, Boris Itkis (Linux) wrote:
>sudu.mk has a problem for building:
>
>$(TARGET_DIR)/usr/bin/sudo
>
>it echo's the command to install sudu instead of running it.

I'll look into this.
>
>It generally does not stop compile because on distributions like fedora 
>because "touch -c" has a exit code of 0 even if the file does no exist.

That's a bug.
Point them to
http://www.opengroup.org/onlinepubs/009695399/utilities/touch.html#tag_04_143_18

which reads
"
At least one historical implementation of touch incremented the exit
code if -c was specified and the file did not exist. This volume of IEEE
Std 1003.1-2001 requires exit status zero if no errors occur.
"
