From: Arun Reddy <reddyac@gmail.com>
Date: Tue, 29 Apr 2008 16:43:30 -0700
Subject: [Buildroot] Buildroot ARM toolchain build Error: libexpat
In-Reply-To: <d6cda7730804291518x5bf85cas204ac3129db5bc1d@mail.gmail.com>
References: <326f33790804281532w187e0968lcc383e59fe65c77a@mail.gmail.com>
	<326f33790804291507pb562331k1782b1b5c48af0f@mail.gmail.com>
	<d6cda7730804291518x5bf85cas204ac3129db5bc1d@mail.gmail.com>
Message-ID: <326f33790804291643y4b2f296bs9b364e1587b21808@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thiago,

I actually did not have expat in the menuconfig. The build process fails
after it does a check for a whole bunch of files shown here...

http://img209.imageshack.us/img209/4053/buildrootproblemra9.jpg

I am not sure whether it needs expat to actually complete the build process
or not. I went ahead and changed my buildroot .config file to include expat
just in case, but I still get the same error. I attached my .config file as
you requested. (I had to save it as a .txt file because I am using
VirtualBox and my shared folder wouldn't accept the .config file itself).
Thank you for your help.

On Tue, Apr 29, 2008 at 3:18 PM, Thiago A. Corr?a <thiago.correa@gmail.com>
wrote:

> Hi,
>
> If this is a package from buildroot that you are compiling, it should
> be looking for libexpat in the staging_dir, not in the system
> libs/includes.
>
> Did you enable expat in the menuconfig? Which package is failing?
> Could you share your .config file?
>
> Kind Regards,
>   Thiago A. Correa
>
> On Tue, Apr 29, 2008 at 7:07 PM, Arun Reddy <reddyac@gmail.com> wrote:
> > A little more info on the problem. I tried to build again using a
> different
> > configuration just to see if the problem was unique, but I ran into the
> same
> > one again. After a little bit of Google searching, it seems to me that
> there
> > might be an undefined symbol error. I looked  at the config.log file to
> see
> > if I could find it but couldn't pinpoint anything.
> >
> > I should also point out, when I look at config.log:
> >
> > (/root/buildroot/build_arm/avahi-0.6.22/config.log), I see that the line
> $
> > ./configure has "--disable-expat" in it. Is this why my build is getting
> the
> > error that libexpat can't be found?
> >
> > Thanks for any help!
> >
> >
> >
> > On Mon, Apr 28, 2008 at 3:32 PM, Arun Reddy <reddyac@gmail.com> wrote:
> > > Hi everyone,
> > >
> > > I have done a kernel configuration for at91sam9263ek, and I am now
> going
> > through the build process. I have fixed up some errors I encountered
> with
> > missing packages, but I then encountered that...
> > >
> > > Checking for XML_ParserCreate in -lexpat... no
> > > Checking for XML_ParserCreate in -lbsdxml... no
> > > Configure: error: *** neither libexpat not libbsdxml could be found
> ***
> > >
> > > I made sure to install the expat package (apt-get install
> libexpat-dev)
> > and tried to find out if I needed to install the libbsdxml package as
> well,
> > but couldn't find enough information online about what libbsdxml is (it
> does
> > seem like it's just another name for libexpat) or any solutions to this
> > error.
> > >
> > > Anyone know what the problem here is, and what package I actually
> need?
> > Thanks!
> > >
> >
> >
> > _______________________________________________
> >  buildroot mailing list
> >  buildroot at uclibc.org
> >  http://busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080429/e08cfbb3/attachment-0001.htm 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config.txt
Url: http://busybox.net/lists/buildroot/attachments/20080429/e08cfbb3/attachment-0001.txt 
