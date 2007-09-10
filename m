From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 11 Sep 2007 00:14:28 +0200
Subject: [Buildroot] Multiprojects
References: <D61182AC8012EA4EBC531B3AF23BE1093F12CE@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <007c01c7f3f8$d4c49340$2d03310a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Darcy Watkins" <DWatkins@tranzeo.com>
To: <buildroot@uclibc.org>
Sent: Monday, September 10, 2007 10:51 PM
Subject: [Buildroot] Multiprojects


> Hello,
> 
> Newbie question here...
> 
> To support multiple projects, I can change the project name using
> menuconfig and save the updated .config.
> 
> If I save them as proj1.config, proj2.config, etc. is there a command
> line option or variable name I can set when invoking make to tell it to
> choose the correct project's file?
> 

Yes, and No ...
I sent in an RFC for such a patch


$ make saveconfig

will save project in 
project/<board>/<board>.config

$ make BOARD=<board> 

will use

project/<board>/<board>.config

instead of 

.config

I am thinking of using another directory than "project" though.

Search the archives for mails from me during the last two weeks.


> ...or do I just have to load up the file into menuconfig and save it as
> .config and then run make for each case?
> 
> Thanks
> 
> Darcy
> 

Best Regards
Ulf Samuelsson
