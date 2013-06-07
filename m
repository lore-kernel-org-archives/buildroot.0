From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 7 Jun 2013 10:22:53 -0400
Subject: [Buildroot] github url updates not working?
Message-ID: <CA+-urNRB=OAVN0V_Jy7+kxVGhb1DjzRUpSe9hmisuqnJy7=Wig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just tried the new github URL updates, and either github is temporarily
having issues, or something else isn't right. Before digging into it, I
figured that I'd ask in case there was a post about this that I missed.

See below for a log of the github.com URLs redirecting and eventually
failing. Also, note the "legacy.tar.gz" part. Is github.com phasing the
tar.gz download out?

>>> linenoise g27a3b4d DownloadingESC[27m
--2013-06-07 09:58:25--
http://github.com/antirez/linenoise/tarball/g27a3b4d/linenoise-g27a3b4d.tar.gz
Resolving github.com (github.com)... 204.232.175.90
Connecting to github.com (github.com)|204.232.175.90|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location:
https://github.com/antirez/linenoise/tarball/g27a3b4d/linenoise-g27a3b4d.tar.gz[following]
--2013-06-07 09:58:25--
https://github.com/antirez/linenoise/tarball/g27a3b4d/linenoise-g27a3b4d.tar.gz
Connecting to github.com (github.com)|204.232.175.90|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location:
https://codeload.github.com/antirez/linenoise/legacy.tar.gz/g27a3b4d/linenoise-g27a3b4d.tar.gz[following]
--2013-06-07 09:58:25--
https://codeload.github.com/antirez/linenoise/legacy.tar.gz/g27a3b4d/linenoise-g27a3b4d.tar.gz
Resolving codeload.github.com (codeload.github.com)... 204.232.175.86
Connecting to codeload.github.com (codeload.github.com)|204.232.175.86|:443...
connected.
HTTP request sent, awaiting response... 404 Not Found
2013-06-07 09:58:25 ERROR 404: Not Found.

--2013-06-07 09:58:25--
http://sources.buildroot.net//linenoise-g27a3b4d.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 11183 (11K) [application/x-gzip]
Saving to: ?/home/fhunleth/buildroot/dl/linenoise-g27a3b4d.tar.gz.tmp?

     0K ..........                                            100%
83.6K=0.1s

<http://troodon-software.com/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130607/6f51a942/attachment.html>
