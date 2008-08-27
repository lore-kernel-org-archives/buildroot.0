From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 27 Aug 2008 08:59:25 -0600
Subject: [Buildroot] ### Executing FIles
In-Reply-To: <46a136670808261706v1335cea6g60889e0262ac00bf@mail.gmail.com>
References: <20080826223720.B77253C6C1@busybox.net>	<00b101c907cd$12fa1840$1a01a8c0@flexeon32>
	<46a136670808261706v1335cea6g60889e0262ac00bf@mail.gmail.com>
Message-ID: <48B56BCD.2000101@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
>     For example, I upload a new executable file that I compile on a host PC.
>     I change its permissions to execute and I type "./myfile"
>     It comes back saying "-sh: myfile not found"
>     BUT, I can vi the file, I can copy it, delete it /etc/etc
>     If I change its permissions to read-only and then try to execute it, the
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
