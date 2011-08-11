From: Dominic Newton <dominic.newton@in-2-technology.co.uk>
Date: Thu, 11 Aug 2011 16:37:16 +0100
Subject: [Buildroot] Python standard library problems
In-Reply-To: <4E43D5B4.2090106@fosstel.com>
References: <4E42D99C.7080806@fosstel.com>
 <4E42FCAB.2070609@in-2-technology.co.uk> <4E43D5B4.2090106@fosstel.com>
Message-ID: <4E43F72C.4060005@in-2-technology.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Yes I'm using the native toolchain. One thing to check might be any 
dependencies the modules you are trying to build - for example have you 
got appropriate libraries being built before python for networking which 
will get _socket built.

The easiest way to look at the setup.py output is to redirect the stdout 
to a file and then inspect it, any messages regarding module builds will 
be there. If python cannot build a module it won't stop, but just sends 
some output to the console. It is possible to edit setup.py to output 
results direct to a log file, but this can take a while to sort out.

Not sure if this is much help as this has (so far) always worked for me 
out of the box for a number of targets.

Dominic Newton
In 2 Technology Ltd.
