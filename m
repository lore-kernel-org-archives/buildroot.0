From: Rico Bachmann <bachmann@tofwerk.com>
Date: Thu, 19 Apr 2012 14:59:48 +0200
Subject: [Buildroot] Error configure apr-util
References: <op.wcyu5ek6705kjs@rico>
Message-ID: <op.wc0jpyoq705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've got rid of the configure error.
I still have a build error, but that is another problem.

The solution was to add the --with-apr to the APR_UTIL_CONF_OPT instead of  
APR_UTIL_CONF_ENV
because it isn't an enviroment variable

When I've get rid of the build-error, i start a new mailing list thread  
for add package apr-util


Am 18.04.2012, 17:11 Uhr, schrieb Rico Bachmann  
<bachmann@tofwerk.com>:

> Hi @ all
>
> I'm trying to add apr-util to buildroot (after successfully adding apr  
> yesterday)
>
> I have a problem while configure apr-util.
> First I build apr, that still works fine.
> But, when I try to link to the apr-1-config from apr when configure  
> apr-util, I've got this error:
>
> /bin/sh:  
> --with-apr=/home/bluefire/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/bin/apr-1-config:  
> No such file or directory
>
> /bin/sh:  
> --with-apr=/home/bluefire/buildroot/output/target/usr/bin/apr-1-config:  
> No such file or directory
>
> I don't understand why it can't see the file!
>
> Here the output from my apr build, that's the place I found the two  
> pathes to the apr-1-config:
>
> http://pastebin.com/04Zn12Tk
>
> and Here the output from my apr-util build (2 versions one linked to  
> /home/bluefire/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/bin/apr-1-config  
> and one linked to  
> /home/bluefire/buildroot/output/target/usr/bin/apr-1-config):
>
> http://pastebin.com/LnzuUWK8
>
> http://pastebin.com/7Ldz93VF
>
> I don't know what I'm doing wrong, because every webpage I found about  
> cross-compiling apr-util says, I have to link to this file!
>
> I'm happy about every hint you can get me!
> If you need it, here the link to my *.mk and Config.in file:
>
> http://pastebin.com/uukHBeq0
>
> If I try without define --with-apr it throws an error that I have to  
> define it.
>
> I need the apr-util package because subversion not only needs apr, it  
> needs apr and apr-util.
> And my goal is to add subversion in buildroot.
>
> so long
> Rico
>


-- 
Erstellt mit Operas revolution?rem E-Mail-Modul: http://www.opera.com/mail/
