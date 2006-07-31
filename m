From: Philippe Ney <philippe.ney@pardes.ws>
Date: Mon Jul 31 12:26:09 2006
Subject: [Buildroot] how to add monit package in buildroot
In-Reply-To: <20060731143003.25363.qmail@webmail32.rediffmail.com>
References: <20060731143003.25363.qmail@webmail32.rediffmail.com>
Message-ID: <20060731211746.403997f4.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  hi list
> 
>         i want to compile monit for my root file system.
>     In my buildroot (buildroot-20060606.tar) there is no option for  
>     monit package like modutils.
> 
>     so i download monit-4.5.tar.gz in dl directory and add entry in 
>    pakage directory Config.in file 
>         source "package/monit/Config.in"
>    
>   then i download monit4.5.tgz from  
>                http://busybox.net/bugs/view.php?id=175
>   and then untar it as monit it contains
>             Config.in  Makefile.in  
>             monit-4.5-cross.patch  monit-4.5-summary.patch  
>              monit.mk 
>   i save monit dir in Pakages dir in buildroot
> 
>   i made few changes in monit.mk
> 
>    change:-#$(DL_DIR)/$(MONIT_SOURCE):
>            # $(WGET) -P $(DL_DIR) $(MONIT_SITE)/$(MONIT_SOURCE)
>    because i already download the code from that side
>    
>   then monit option is visible in make menuconfig after that i select that option and see it in .config file
>                 
>            BR2_PACKAGE_MONIT=y
>  after that i give command make but monit code is not compiled
> 
>  so please guide me to compile monit
> 
>   amit


Hi,

Try some 'echo' or 'read' command in monit.mk to see if it is parsed
and what are the values of some variables.

For example in the main Makefile, the value of TARGETS after everything
should have been parsed.

Philippe
