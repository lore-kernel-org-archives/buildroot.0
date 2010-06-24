From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 24 Jun 2010 10:48:09 -0500
Subject: [Buildroot] make linux26-force
In-Reply-To: <20100624092307.38486bc6@surf>
References: <0D753D10438DA54287A00B027084269763716C534F@AUSP01VMBX24.collaborationhost.net>
	<20100624092307.38486bc6@surf>
Message-ID: <0D753D10438DA54287A00B02708426976372DCA426@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, June 24, 2010 12:23 AM, Thomas Petazzoni wrote:
> On Wed, 23 Jun 2010 17:59:33 -0500
> H Hartley Sweeten <hartleys@visionengravers.com> wrote:
>
>> Is there a reason make linux26-force was removed by the linux-cleanup commit?
>
> Because I haven't seen the use case for that. Which use case does this
> solve ?
>
> The kernel already gets rebuilt whenever its .config file is changed
> (by means of linux26-menuconfig, linux26-xconfig, or directly). Isn't
> this enough ?

No.  Manually adding a new patch or making a change to one of the source
files will not cause the kernel to be rebuilt.  And, doing a linux26-menuconfig
also will not cause the rebuild (unless something is changed).

I'm trying to bring up a new board design so I am always making changes to
my kernel board init file, either to enable a new feature or test something.

I know I can force the rebuild by touching the stamp_configured file but
it's kind of a hassle since I was used to just doing either:

$ make linux26-force;make

Of 

$ make linux26-force;make linux26

This has worked fine for me since I started using buildroot.  The linux-cleanup
commit changed that behavior.

Regards,
Hartley
