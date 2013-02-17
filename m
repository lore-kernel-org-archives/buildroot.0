From: Shawn J. Goff <shawn7400@gmail.com>
Date: Sun, 17 Feb 2013 12:56:11 -0500
Subject: [Buildroot] Adding a ModemManager package
In-Reply-To: <20130217183148.2cc7dd92@skate>
References: <51210E6F.6000504@gmail.com> <20130217183148.2cc7dd92@skate>
Message-ID: <512119BB.9000200@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/17/2013 12:31 PM, Thomas Petazzoni wrote:
> Dear Shawn J. Goff,
>
> On Sun, 17 Feb 2013 12:07:59 -0500, Shawn J. Goff wrote:
>> I'm trying to add a ModemManager package. While building, I'm getting
>> this error during the installation step: "/usr/lib/libgcc_s.so: file not
>> recognized: File format not recognized". This looks like it's looking at
>> my host's libgcc_s.so instead of the target's version. If that's the
>> case I'm not sure why or how to fix it. I did have to use autogen.sh to
>> create the configure script and lots of other stuff; I did this on my
>> host system, so I'm not sure if that is affecting it.
> Could you post the in-progress patch you have to add the modem-manager
> package? This would allow us to check for potential suspicious things
> in the .mk file, and if nothing suspicious shows up, to try and
> reproduce the issue.
>
> Thanks!
>
> Thomas

Sure, here's a patch. udev was disabling gudev; for now, I had to remove 
that part because the default configuration of ModemManager seems to 
require it. I don't have a patch for the autogen-created files yet. I 
run make, then go to the build directory and run "NOCONFIGURE=yes 
./autogen.sh", then go back and continue running make.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-ModemManager-initial-package-addition.patch
Type: text/x-patch
Size: 3149 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130217/066dc0c9/attachment.bin>
