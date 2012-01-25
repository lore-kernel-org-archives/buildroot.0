From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jan 2012 07:28:45 +0100
Subject: [Buildroot] compiling package/libcgi before my cgi code
In-Reply-To: <1327461829.96179.YahooMailNeo@web120202.mail.ne1.yahoo.com>
 (Sridhar Addagada's message of "Tue, 24 Jan 2012 19:23:49 -0800
 (PST)")
References: <1327461829.96179.YahooMailNeo@web120202.mail.ne1.yahoo.com>
Message-ID: <87d3a88fdu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sridhar" == Sridhar Addagada <sridhar_a@yahoo.com> writes:

 Sridhar> Hi,

 Sridhar> I'm working to implement web management on our device, and
 Sridhar> have enabled lighttpd, and created a new directory under
 Sridhar> packages (packages/mycgi) where i put in my xxx-cgi.c code.  I
 Sridhar> need to make sure that libcgi compiles before my cgi sources
 Sridhar> are compiled.  Here is the makefile I've cooked up.  Any
 Sridhar> suggestions appreciated.

You use rather use the new-style GENTARGETS format, and simply add
WEBCFG_DEPENDENCIES = libcgi like you already did. For details, see the
documentation:

http://buildroot.net/buildroot.html#generic-tutorial

-- 
Bye, Peter Korsgaard
