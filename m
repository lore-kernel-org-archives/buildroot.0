From: Ron Eggler <reggler@semiosbio.com>
Date: Tue, 15 May 2012 14:13:39 -0700
Subject: [Buildroot] (newbie question)
In-Reply-To: <20120515224254.6bff263a@skate>
References: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
 <20120515224254.6bff263a@skate>
Message-ID: <CAFC29aUwvGS-tsbLiCe7=7W1HZ0UZ409BMhf5Y73r289FSuNUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2012 at 1:42 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> Le Tue, 15 May 2012 13:28:02 -0700,
> Ron Eggler <reggler@semiosbio.com> a ?crit :
>
> > I downloaded a build root archive that compiles for my Synapse E-10
> > (running ARM9) that works fine. I wanted to add several packages to it, I
> > added folders in the package/ directory and added Config.in and
> > package.mkfiles as described on
> > http://buildroot.uclibc.org/buildroot.html#add_packages (also added it
> to
> > package/Config.in but for some reason, I don't seem to get the binaries
> in
> > my final build, why would that be?
>
> Can you post the patch adding your packages? Without looking at your
> Config.in and <pkg>.mk file, it is merely impossible to help you in
> understanding why your binaries aren't installed in the target
> filesystem.
>

Hi Thomas,

I've been trying to get some diff going with this commmand but somehow I
don't get a good result, why's that?
reg at desktop-reg:/usr/local/src/E10-buildroot/br1202-main/package$ diff -r
./ ../../../E10orig_clone/br1202-main/package/

It looks like:
diff -r ./Config.in ../../../E10orig_clone/br1202-main/package/Config.in
9,14d8
< #WView
< source "package/radlib/Config.in"
< source "package/gd/Config.in"
< source "package/libreadline5/Config.in"
< source "package/wview/Config.in"
<
228,229c222,223
< source "package/usb_\modeswitch/Config.in"
< source "package/usb_\modeswitch_data/Config.in"
---
> source "package/usb_modeswitch/Config.in"
> source "package/usb_modeswitch_data/Config.in"
Only in ./: gd
Only in ./: libreadline5
Only in ./: libz
Only in ./: radlib
Only in ./: wview
Only in ./: wview-5.20.2.tar.gz

But doesn't show the changes I made in the .mk files....

Thanks,
Ron
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120515/7258fcec/attachment-0001.html>
