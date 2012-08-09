From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 9 Aug 2012 09:32:24 +0200
Subject: [Buildroot] Best practices for managing the dl directory
In-Reply-To: <CA+-urNRgQ5ExvyLq1q4kZj-jp6KHueDC=LG9+Y3J2n7cOz0LAg@mail.gmail.com>
References: <CA+-urNRgQ5ExvyLq1q4kZj-jp6KHueDC=LG9+Y3J2n7cOz0LAg@mail.gmail.com>
Message-ID: <CAAXf6LV42mQyHTHFSDu9Kpzy0cOb1JbV5Pm1Z0U4HVaqQczKew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Aug 9, 2012 at 4:24 AM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Hello,
>
> I was wondering how others have managed files in the dl directory. I
> need to make sure that old versions are buildable. The main buildroot
> upstream source code mirror has been extremely reliable. In fact, it
> has never failed for me (a big thanks to everyone who maintains this),
> but as you can imagine some people want every bit that goes into a
> build to be locally managed. I've addressed this in the past by
> setting up a local mirror that has copies of all of the files in the
> dl directory. However, recently, it was desired that all of these
> files be checked in under revision control. This didn't seem like a
> bad suggestion in principle, but the files are large, and I'm afraid
> that the git repository will soon become too large and slow to work
> with regularly.
>
> Does anyone manage their dl directories differently? I'm curious how
> other people have managed this.

I have set up a mirror of the files, accessed using scp from a network location.
As the tarballs have version numbers in their filename, I did not see
the need for a version control system on top of it.

I simply have a mechanism to prevent overwrites of existing files.

Best regards,
Thomas
