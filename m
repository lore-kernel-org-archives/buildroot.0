From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2008 16:35:13 +0200
Subject: [Buildroot] advice on makefile
In-Reply-To: <1207836719.6817.433.camel@nigel-x60> (Nigel Kukard's message of
	"Thu\, 10 Apr 2008 14\:11\:59 +0000")
References: <1207827171.6817.432.camel@nigel-x60>
	<87tzi9apo6.fsf@macbook.be.48ers.dk>
	<1207836719.6817.433.camel@nigel-x60>
Message-ID: <8763upaice.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

Hi,

 Nigel> What is going on in libxml2.mk?  I need to add libxml as one of the
 Nigel> deps  :)

That's the new autotools autotargets stuff. I don't know much about
it, but take a look at package/Makefile.autotools.in.

The problem is going to be that the automatic rules uses
$BUILD_DIR/package-<version>/.stamp_staging_installed, so you'll have
to hardcode the version and it'll break when the version is bumped.

Maybe we should rather add a .stamp_<package>_<whatever> directly in
BUILD_DIR?

-- 
Bye, Peter Korsgaard
