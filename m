From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Wed, 04 Feb 2009 08:24:30 -0800
Subject: [Buildroot] Webserver
Message-ID: <4989C13E.5040603@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List:

We are using buildroot v2009.02 on a Fedora 10 linux distro. Our 
architecture is for Atmel AT91SAM9G20-EK development board. We want a 
more robust web server than the BOA or Busybox HTTPD. Our main 
requirement is to have the web server make a web browser (IE6, IE7, 
Firefox etc.) display a login/password box. It seems the two mentioned 
web servers do not support this.

Apache seems overkill for our needs, so we wanted to try 
Cherokee-0.98.1:  http://www.cherokee-project.com/

Using /buildroot/scripts/add_new_package.wizard we are able to make our 
package show up in the make menuconfig configurator utility. When we do 
a make from the top level directory we can see Cherokee gets downloaded 
and starts to compile, but it errors out with these errors below:

spawn-fcgi.o: In function 
`fcgi_spawn_connection':                                                                          

spawn-fcgi.c:(.text+0x340): undefined reference to `rpl_malloc' 
collect2: ld returned 1 exit 
status                                                                                         

make[3]: *** [spawn-fcgi] Error 
1                                                                                           

make[3]: Leaving directory 
`/home/ethertek/rms200/buildroot/build_arm/cherokee-0.98.1/contrib'                              

make[2]: *** [all-recursive] Error 
1                                                                                        

make[2]: Leaving directory 
`/home/ethertek/rms200/buildroot/build_arm/cherokee-0.98.1'                                      

make[1]: *** [all] Error 
2                                                                                                  

make[1]: Leaving directory 
`/home/ethertek/rms200/buildroot/build_arm/cherokee-0.98.1'                                      

make: *** 
[/home/ethertek/rms200/buildroot/build_arm/cherokee-0.98.1/.stamp_built] 
Error 2

We can see the error: undefined reference to `rpl_malloc', but being new 
to cross compiling, we do not know how to fix it.

Can someone please help us get cherokee to compile for our architecture?

Also, when using the add_new_package.wizard, how do you know when to 
select "Does autoreconf need to be run first?". It did not seem to 
matter in the case of cross compiling Cherokee-0.98.1

Lastly, does anyone know of a different web server for Buildroot that 
will make the most common web browsers (IE6, IE7, Firefox etc) pop up 
the username/password box?

Thank you, and Best Regards,
Dan Pattison
