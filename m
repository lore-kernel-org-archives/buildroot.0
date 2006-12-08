From: Petr Stetiar <ynezz@true.cz>
Date: Fri, 8 Dec 2006 09:35:29 +0100
Subject: [Buildroot] udev make errors
In-Reply-To: <C6F82487-A777-4606-9447-B6AEDDEA1F00@linux.it>
References: <3662182B-2B05-4C74-94FC-15AA4864BCB9@linux.it>
	<C6F82487-A777-4606-9447-B6AEDDEA1F00@linux.it>
Message-ID: <20061208083529.GA3087@ibawizard.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rafael A Barrero <rafa@linux.it> [2006-12-07 19:55:50]:

> Hi;
> 
> Here's what I've been able to come up with:
> 
> If you take a look at the make log I have below, you'll see the  
> following line:
> 
>  > mkdir /root/src/buildroot/build_i686/root/udev/rules.d
> 
> This however, fails because the parent directory /root/src/buildroot/ 
> build_i686/root/udev/ does not exist before the child directory is  
> created (/root/src/buildroot/build_i686/root/udev/rules.d). A  
> solution the process is to use"mkdir -p" will solve this, or simply  
> creating both parent and the child directories sequentially.

'mkdir -p'  was in my patch and probably not get commited :) 
http://buildroot.uclibc.org/lists/buildroot/2006-November/000665.html

> By reading this the error seems obvious to me... although someone  
> help me out here - are we missing 'udev.conf' in buildroot? Can  
> someone please import this file into CVS?

I'll send a patch addressing both issues later today when I get home.

-- ynezz
