From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 09:24:49 +0100
Subject: [Buildroot] [PATCH 1/1] liboping: fix format-truncation error
In-Reply-To: <20181206223909.23161-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 6 Dec 2018 23:39:09 +0100")
References: <20181206223909.23161-1-fontaine.fabrice@gmail.com>
Message-ID: <87lg505stq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > liboping.c: In function 'ping_host_add':
 > liboping.c:207:9: error: '%s' directive output may be truncated writing
 > up to 255 bytes into a region of size 243 [-Werror=format-truncation=]
 >     "%s: %s", function, message);
 >          ^~
 > liboping.c:1644:40:
 >     ping_set_error (obj, "getaddrinfo", errmsg);
 >                                         ~~~~~~
 > liboping.c:206:2: note: 'snprintf' output between 14 and 269 bytes into
 > a destination of size 256
 >   snprintf (obj->errmsg, sizeof (obj->errmsg),
 >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >     "%s: %s", function, message);

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b12d86388b495a96194e0bcbb5c19a4e35cbc53d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

I see it is built with -Werror. Is there any easy way to disable that?

-- 
Bye, Peter Korsgaard
