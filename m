From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 25 Sep 2013 07:29:40 -0500
Subject: [Buildroot] [PATCH v2 13/17] audit: new package
In-Reply-To: <20130924235715.47ca2a68@skate>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>	<1378936777-28308-14-git-send-email-clshotwe@rockwellcollins.com>
 <20130918070020.22ff8ca9@skate>	<OF1C36952D.12623546-ON86257BF0.0061A062-86257BF0.0061C58C@rockwellcollins.com>
 <20130924235715.47ca2a68@skate>
Message-ID: <OF2AC6A1BB.46077216-ON86257BF1.00444464-86257BF1.0044A19D@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/24/2013 
04:57:15 PM:

> Hum this is strange because with CFLAGS_FOR_BUILD, you're supposed to
> receive the correct -I arguments even for building host tools. I really
> believe adding Python as a build dependency for something that already
> has a nice C program to be built is not the nicest move. Of course, if
> that's upstream choice, then we'll follow it, but I believe it's not
> the best choice.

I guess I should give a little more detail on what the C program is doing. 
 That program takes kernel syscall numbers and generates lookup tables to 
reference the number to a string.  This is used in decoding the audit log 
information and presenting it in a method that is human readable.  The 
issue I am seeing with building it for the host is incorrect tables are 
generated.  I do not know of a way to get a C program to compile using 
different kernel headers and preprocessor values.  Do you know of a way to 
do this?

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
