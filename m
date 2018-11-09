From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Nov 2018 09:55:13 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <87bm6z89dp.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 08 Nov 2018 23:58:10 +0100")
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <87bm6z89dp.fsf@dell.be.48ers.dk>
Message-ID: <877ehm8wb2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 > tar --xattrs --xattrs-include='*.*' -xvvvf ../foo.tar && getcap usr/bin/i3status
 > -rwxr-xr-x* root/root     84888 2017-01-21 15:42 usr/bin/i3status
 >   x: 20 security.capability
 > usr/bin/i3status = cap_net_admin+ep

 > Now it works.

 > I don't see where we are passing --xattrs-include. Are we sure this is a
 > fakeroot issue after all?

Digging further, this is apparently expected (if confusing) behaviour:

https://bugzilla.redhat.com/show_bug.cgi?id=771927#c21

-- 
Bye, Peter Korsgaard
