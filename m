From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 30 Dec 2018 20:15:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/python3-setuptools: new package
In-Reply-To: <20181230142407.69d10ba8@windsurf>
References: <1546152095-4439-1-git-send-email-james.hilliard1@gmail.com>
 <20181230121932.39e696f9@windsurf>
 <CADvTj4qinyrbrutcb_WkO4rveJgA9i9F6bX9Txhp+MAWxZSyfg@mail.gmail.com>
 <20181230142407.69d10ba8@windsurf>
Message-ID: <CALFsTFUXOqqGEUfFuT62jD=7xJVCg09wk6BNf0mAi_dFZ+_cGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Dec 30, 2018 at 3:24 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sun, 30 Dec 2018 06:10:04 -0600, James Hilliard wrote:
>
> > > Could you instead test if those patches also work for you ?
> > Looks good, I was able to successfully do a clean build with my meson
> > version bump patch on top.
>
> Thanks for the confirmation. Do you know what changed in Meson that
> makes it *require* setuptools? As I explained in the cover letter of my
> Python 3 Setuptools series, meson (at least in the version we currently
> have in Buildroot) uses setuptools if available, and otherwise falls
> back to distutils, which is why it has been working well so far without
> a python3-setuptools package.

I don't heavily use the meson build system, but after looking at the
history of setup.py in the official repository,
I found the commit which made the change. At the commit message they
stated that:
"This gives us a consistent experience and a simpler setup across all
operating systems. Setuptools is available everywhere these days."
The change is relevant since 0.48.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Asaf.
