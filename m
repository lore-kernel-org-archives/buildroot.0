From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 19 Sep 2012 21:58:20 -0400
Subject: [Buildroot] rootfs hooks okay to use?
In-Reply-To: <20120919071423.3ac203d0@skate>
References: <CANxTyt7HEBtj+WUzAcwii7n9K3drUEz=34yMAOeN8FHOG2DqfA@mail.gmail.com>
 <20120919071423.3ac203d0@skate>
Message-ID: <CANxTyt66WpjL0NaJM2tAGkhzVwxrQko8W=uk8Si+R7z_0DnzWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Sep 19, 2012 at 1:14 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
>> So - are the rootfs hooks okay for general use, or are they reserved
>> strictly for fs/*/*.mk use?
>
>Depends on what you want them to do. What are you trying to do, in the
>end?

WRT if multiple hooks can be used, does it matter?

I have a single setup that is supporting two different hardware
configurations, one with the serial port on ttyO2, and the other on ttyO0.
 I'm already using a custom skeleton, but since the only difference and a
rootfs custom script.  Since the difference in getty setup is so small, I
don't want to maintain a completely separate skeleton, when a simple sed
line would do.  Using the rootfs custom script is possible, but then I have
to call "make" again, since the script doesn't know any of the variables,
other than the target directory.  So adding a simple hook seems like a good
way to go, and I'd like to make it as late in the process as possible.  The
rootfs hooks seemed like a suitable fit.

Since the package hooks let me add multiple hooks, I expected the rootfs
hooks to do so too ...

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120919/02042aa5/attachment.html>
