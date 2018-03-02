From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 2 Mar 2018 09:08:06 -0800
Subject: [Buildroot] [PATCH 2/2] apache init script
In-Reply-To: <20180227221815.21afde38@windsurf.lan>
References: <20180227115022.8802-1-chrismcc@gmail.com>
 <20180227221815.21afde38@windsurf.lan>
Message-ID: <CALURroQSLWQ1TD7gEf-KYqOg3Y8x9mZeo3DAkKd2-B=MZwO02g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

D'oh sending to list also

<snip>


> What does the complete init script looks like after your patch ? Is it
> worth re-using the init script provided by Apache, as opposed to
> providing a simple one in package/apache/S<xy>apache  ?
>
>

I started with the idea of changing just enough of the included init script
to get the daemon running.  I am used to the RedHat/Fedora sysv init
system, not the debian/start-stop-daemon style.  I didn't want to snag some
other init file using start-stop-daemon, replace a variable, and submit it
as my own work.  I'd rather learn the nuances of start-stop-daemon and
write a script that I understand and works as expected.

After testing a few other packages, I noticed quite a few that don't have
init scripts.  Is this by design?  I'd like to add the ability to generate
an initscript within the buildroot system.  something like
$PACKAGE_GENERATE_AND_INSTALL_SYSV_INIT_SCRIPT = YES # with a shorter name
though :)
in the package.mk file that would use a template to create a working init
script. And a global toggle in makemenu -> Build Options to
enable/disable.  yes? no? maybe?


<snip>

-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180302/e0f60077/attachment.html>
