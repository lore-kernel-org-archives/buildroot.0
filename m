From: Chrissy <c.pfindel@googlemail.com>
Date: Mon, 07 Dec 2009 14:19:24 +0100
Subject: [Buildroot] Problem configuring dbus-glib
In-Reply-To: <877hszqksf.fsf@macbook.be.48ers.dk>
References: <4B1C39E5.4020402@googlemail.com>
	<877hszqksf.fsf@macbook.be.48ers.dk>
Message-ID: <4B1D00DC.1050005@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard schrieb:
>>>>>> "Chrissy" == Chrissy  <c.pfindel@googlemail.com> writes:
> 
>  Chrissy> Hi,
>  Chrissy> while configuring dbus-glib I get the following error:
> 
> 
>  >>>> dbus-glib 0.80 Configuring
> 
>  Chrissy> checking for XML_ParserCreate_MM in -lexpat... (cached) no
>  Chrissy> configure: error: expat library not found, check config.log for failed
>  Chrissy> attempts
> 
>  Chrissy> I'm using the stable buildroot-2009.11.
>  Chrissy> The XML_ParserCreate_MM can be found in the staging/usr/lib/libexpat.so.
>  Chrissy> So does anybody know how to solve this?
> 
> Notice the (cached) part. This means that your configure cache somehow
> lists expat as not being available. A quick fix is to run "make flush",
> but please send your .config to the list and I'll try to figure out what
> package needs to be fixed.
> 
> Is this with a clean rebuild or have you first built something and then
> afterwards added dbus-glib without running make clean in between?
> 

Hi,
thanks for the hints.
I did no clean rebuild. I got some errors because of missing libraries 
in my (external) toolchain, built before with buildroot not having to 
build the toolchain on every rebuild. I simply went on when the errors 
were solved.
So I'll try a clean rebuild and report afterwards.
My .config is attached.
Thanks so long
Chrissy
