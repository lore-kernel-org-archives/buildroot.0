From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Mon, 12 Dec 2016 08:50:20 -0000
Subject: [Buildroot] Using 2016.11-rc2: external packages and BR2_EXTERNAL ?
Message-ID: <23ce01d25454$c528d7e0$4f7a87a0$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings. Any thoughts on this one?  

 

This post (
<http://buildroot.uclibc.narkive.com/wXlmUu43/patch-br2-external-make-it-ava
ilable-to-post-build-image-scripts>
http://buildroot.uclibc.narkive.com/wXlmUu43/patch-br2-external-make-it-avai
lable-to-post-build-image-scripts) suggests BR2_EXTERNAL is exported to all
configure/make/shell stages.

 

Given the following external config.in

 

#---------------snip---------------------

source "$BR2_EXTERNAL_TARGET1_PATH/package/libxyz/Config.in"

source "$BR2_EXTERNAL/package/appxyz/Config.in"

#---------------snip---------------------

 

Any attempt to configure fails with

 

/home/user/br/external/target1/Config.in:2: can't open file
"/package/appxyz/Config.in"

 

What is the best way to ensure $BR2_EXTERNAL is available at the configure
stage?

 

TAIA and BR

 

Jerry.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161212/374bc3ca/attachment.html>
