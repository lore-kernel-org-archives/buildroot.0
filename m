From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 5 Aug 2008 12:20:34 +0200
Subject: [Buildroot] C double type problem - at91sam9263
References: <223E6519BDCAC74695BEE9D163F8E6592306E3@oakleaf10.oakleafconsultancy.com>
Message-ID: <124CCF3A7F044A16AD37AB1433ADEBD3@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
  From: Richard Hardy 
  To: buildroot at uclibc.org 
  Sent: Monday, August 04, 2008 12:29 PM
  Subject: [Buildroot] C double type problem - at91sam9263


  Hi Everyone,

  I am quite new to using buildroot and embedded linux systems in general. However, I have managed to use buildroot to get a (nearly) working system up and running for an at91sam9263 board. (kernel v 2.6.22, uClibc v 0.9.29)

   

  I have one annoying problem though. One of the packages I am compiling from source uses C's "double" type, and this does not seem to be behaving as I need it to.

   

  I have created a simple example program:

   

  .

  int main (int argc, char *argv[])

  {

  double test;

  test = 1;

  fprintf(stderr, "Test double = %f.\n", test);

  }

   



Should you not be using "%lf" instead of "%f" ?

   fprintf(stderr, "Test double = %lf.\n", test);

   fprintf(stderr, "Test double = %f.\n", test);

Best Regards
Ulf Samuelsson
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080805/858a43c6/attachment.htm 
