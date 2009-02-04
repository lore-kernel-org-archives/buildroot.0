From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Feb 2009 00:21:08 +0100
Subject: [Buildroot] Web Server
In-Reply-To: <498A1FA9.1070306@ethertek.ca> (Dan Pattison's message of "Wed\,
	04 Feb 2009 15\:07\:21 -0800")
References: <498A1FA9.1070306@ethertek.ca>
Message-ID: <878woldc0r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Pattison <dan.pattison@ethertek.ca> writes:

 Dan> Hello List:
 Dan> We are using buildroot v2009.02 on a Fedora 10 linux distro. Our
 Dan> architecture is for Atmel AT91SAM9G20-EK development board. We want a
 Dan> more robust web server than the BOA or Busybox HTTPD. Our main
 Dan> requirement is to have the web server make a web browser (IE6, IE7,
 Dan> Firefox etc.) display a login/password box. It seems the two mentioned
 Dan> web servers do not support this.

Standard http auth? Both busybox httpd and boa supports that.

 Dan> Apache seems overkill for our needs, so we wanted to try
 Dan> Cherokee-0.98.1:  http://www.cherokee-project.com/

We also have lighttpd in busybox, maybe take a look at that.

 Dan> Using /buildroot/scripts/add_new_package.wizard we are able to make
 Dan> our package show up in the make menuconfig configurator utility. When
 Dan> we do a make from the top level directory we can see Cherokee gets
 Dan> downloaded and starts to compile, but it errors out with these errors
 Dan> below:

 Dan> spawn-fcgi.o: In function `fcgi_spawn_connection':                                                                           

 Dan> spawn-fcgi.c:(.text+0x340): undefined reference to `rpl_malloc'
 Dan> collect2: ld returned 1 exit status                                                                                          

Check config.log, you normally have to set a *_cv_func_malloc_* (don't
remember the exact name offhand) variable to not get it to use this
malloc wrapper.

-- 
Bye, Peter Korsgaard
