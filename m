From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 15 Dec 2006 16:29:21 +0100
Subject: [Buildroot] Problem with building sudo
In-Reply-To: <20061215151039.GA14633@aon.at>
References: <4579D9F3.1070400@fortunet.com> <20061215151039.GA14633@aon.at>
Message-ID: <20061215152921.GB14633@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 15, 2006 at 04:10:39PM +0100, Bernhard Fischer wrote:
>On Fri, Dec 08, 2006 at 01:32:35PM -0800, Boris Itkis (Linux) wrote:
>>sudu.mk has a problem for building:
>>
>>$(TARGET_DIR)/usr/bin/sudo
>>
>>it echo's the command to install sudu instead of running it.
>
>I'll look into this.

Can you update and retry? The installation is done via fakeroot, sudo
didn't depend on fakeroot so may not be built for you, depending on your
config.

>>
>>It generally does not stop compile because on distributions like fedora 
>>because "touch -c" has a exit code of 0 even if the file does no exist.
>
>That's a bug.

Nah, it's of course not. Not exiting with ACK would have been.
Note to self: the character '0' denotes 0, not 1 ;)
