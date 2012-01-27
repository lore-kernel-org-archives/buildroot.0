From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Jan 2012 16:12:42 +0100
Subject: [Buildroot] Bug 3877 - Patch not working
In-Reply-To: <BLU0-SMTP1654BA5FF86775DFCB3429FD28E0@phx.gbl>
 (inblueswithu@hotmail.com's message of "Fri, 27 Jan 2012 15:24:09
 +0530")
References: <BLU0-SMTP12114F40C37660CBB539A15D28E0@phx.gbl>
 <BLU0-SMTP1654BA5FF86775DFCB3429FD28E0@phx.gbl>
Message-ID: <87wr8dji1h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "inblueswithu" == inblueswithu  <inblueswithu@hotmail.com> writes:

 inblueswithu> Hi,

 inblueswithu> I 've got "undefined reference to `accept4'" this error
 inblueswithu> while using buildroot.  When I googled, I got this patch:
 inblueswithu> https://bugs.uclibc.org/attachment.cgi?id=
 inblueswithu> 3415&action=edit

uClibc will only add an accept4() function if your kernel headers expose
sys_accept4, which for ARM was only added in 2.6.36.

Make sure your kernel headers (and runtime kernel) is atleast 2.6.36.

-- 
Bye, Peter Korsgaard
