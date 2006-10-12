From: Will Newton <will.newton@gmail.com>
Date: Thu, 12 Oct 2006 12:05:08 +0100
Subject: [Buildroot] gettext fixes
In-Reply-To: <20061012105625.GC2704@zelow.no>
References: <87a5b0800610060905v7113e64cr25aea42df284976d@mail.gmail.com>
	<20061011164707.GA28171@aon.at>
	<87a5b0800610120213m388e948v2eeb57a629d304cc@mail.gmail.com>
	<20061012101533.GB2704@zelow.no>
	<87a5b0800610120321k6509bebsec35656c4f9136fd@mail.gmail.com>
	<20061012105625.GC2704@zelow.no>
Message-ID: <87a5b0800610120405h2cef2eb7n59cd7f71634bcd48@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/12/06, Thomas Lundquist <lists@zelow.no> wrote:

> darn, this was probably the best timing I've had in ages.
> Thanks alot.
>
> But I ended up with:
>
> checking for glib-genmarshal... no
> configure: error: Could not find a glib-genmarshal in your PATH
> make: *** [/home/thomasez/buildroot/build_arm/glib-2.12.4/.configured]
> Error 1

I believe this is because you don't have the glib2.x development files
installed on your build host. My build server has the RPM
glib2-devel-2.4.7-1 installed which provides that.

> > You will need to change the values of glib_cv_stack_grows and
> > glib_cv_uscore for your arch I would imagine.
>
> gotta find out what I have to put there then :=)

glib_cv_uscore=no
glib_cv_stack_grows=no

if you are using ARM Linux (Stack grows down, C symbols have no
leading underscore)
