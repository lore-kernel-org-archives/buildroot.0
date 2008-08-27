From: Steve Spano <steve@fl-eng.com>
Date: Wed, 27 Aug 2008 16:55:02 -0400
Subject: [Buildroot] ### Executing FIles
In-Reply-To: <48B56BCD.2000101@gnat.ca>
Message-ID: <002e01c90887$2dad5070$1a01a8c0@flexeon32>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Folks

Thanks for the help

The uCLibc/glibc issue was the problem. Thank you again for the help!

Steve Spano, President
Finger Lakes Engineering


-----Original Message-----
From: Nathanael D. Noblet [mailto:nathanael at gnat.ca] 
Sent: Wednesday, August 27, 2008 10:59 AM
To: John Voltz
Cc: steve at fl-eng.com; buildroot at uclibc.org
Subject: Re: [Buildroot] ### Executing FIles

John Voltz wrote:
> On Tue, Aug 26, 2008 at 6:42 PM, Steve Spano <steve@fl-eng.com 
> <mailto:steve@fl-eng.com>> wrote:
> 
>     Hello
> 
>     I am stumped on this issue
> 
>     I have a buildroot filesystem running and I cannot seem to execute
>     new files
>     that I have placed on it.
> 
>     For example, I upload a new executable file that I compile on a host
PC.
>     I change its permissions to execute and I type "./myfile"
>     It comes back saying "-sh: myfile not found"
>     BUT, I can vi the file, I can copy it, delete it /etc/etc
>     If I change its permissions to read-only and then try to execute it,
the
>     shell tells me "permission denied".

If you are executing a shell script, I've seen that error before when 
there were hidden utf-8 marks or dos line feeds in the first line.

I think I've also seen it when you compile a program and link it against 
  glibc and then try to run it against uclibc. It can't load the loader 
portion of the C library I think. Otherwise other missing linked library 
files typically provide an error message about 'unable to load libxxx.so'


-- 
Nathanael d. Noblet
Gnat Solutions, Inc
T: 403.875.4613


-- 
Internal Virus Database is out-of-date.
Checked by AVG. 
Version: 7.5.524 / Virus Database: 270.6.0/1602 - Release Date: 8/9/2008
1:22 PM
