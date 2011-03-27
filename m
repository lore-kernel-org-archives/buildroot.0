From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Mar 2011 00:07:40 +0200
Subject: [Buildroot] [PATCH 1/1] qt: convert to the GENTARGETS
	infrastructure
In-Reply-To: <4D8CC4C9.2080104@carallon.com> (Will Wagner's message of "Fri,
	25 Mar 2011 16:37:29 +0000")
References: <cover.1300630739.git.thomas.petazzoni@free-electrons.com>
	<39ac37ec67acf7886777166a098039bbab39b691.1300630739.git.thomas.petazzoni@free-electrons.com>
	<4D8CC4C9.2080104@carallon.com>
Message-ID: <87k4fkusib.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

Hi,

 Will> I have found three issues with this patch:

 Will> Should be:
 Will> +else ifeq ($(BR2_i386),y)
 Will> Not
 Will> +else ifeq ($(BR2_x86),y)

 Will> Should be:
 Will> ifneq ($(findstring x86,$(QT_EMB_PLATFORM)),)
 Will> Not
 Will> ifneq ($(findstring x86,$(BR2_PACKAGE_QT_EMB_PLATFORM)),)

 Will> Finally whitespace formatting is slightly inconsistent for the
 Will> QT_DEPENDENCIES libglib2, directfb and tslib

 Will> Assuming you fixup those three minor things
 Will> Acked-by: Will Wagner <willw@carallon.com>

Fixed, thanks.

 Will> As a slight aside I have a number of Qt patches in my tree that I'd
 Will> love to get merged if there was any interest.

 Will> First is to allow compiling Qt for X11 rather than embedded. This is
 Will> involves a slight hack as Qt doesn't officially support cross
 Will> compiling the X11 version, however I have it working well and have
 Will> been in touch with Nokia support who say that although not officially
 Will> supported it should work

 Will> Second is re-adding commercial support. i know we had this before and
 Will> it was removed, however I'm stuck with some projects that have to use
 Will> the commercial license. I have done it slightly differently to how it
 Will> was before, it no longer needs login details to download the tarball,
 Will> instead it just fails with an explanation if it isn't in your
 Will> buildroot dl folder.

 Will> Other patches include Qt Declarative config option, more font config
 Will> options.

 Will> If people are interested I'll submit patches.

I am, please submit - I'll add them If they are not too intrusive.

-- 
Bye, Peter Korsgaard
