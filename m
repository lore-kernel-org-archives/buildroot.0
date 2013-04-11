From: Francesco Montorsi <francesco.montorsi@gmail.com>
Date: Thu, 11 Apr 2013 10:06:26 +0000 (UTC)
Subject: [Buildroot] syslog messages during boot not recorded?
References: <loom.20130408T181747-784@post.gmane.org>
 <5162F298.7060909@zacarias.com.ar>
 <CAKW0qihWyAonXk7=TB_Hq8q3E_pBuCv94D7eQ890ePx6b_CbMw@mail.gmail.com>
 <5162F662.1010608@zacarias.com.ar>
 <CAKW0qiihqK3F7yCQm6X2F8mk3PjF1q3Noj+19xKm3AyYXdvNNQ@mail.gmail.com>
 <CAKW0qiisGpio87MM3NFWoKZqvRSnH4_ieeaoh2F+45pRs-=UgA@mail.gmail.com>
Message-ID: <loom.20130411T120416-408@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A few more results from my investigations: the absence of logged messages 
does not depend from the values of the facility/level options passed to 
openlog() or syslog() (apparently).
Moreover, a process started at boot time and doing periodic syslog() calls, 
will generate output in /var/log/messages at some point, but all its initial 
syslog() messages are lost.

At this point, I will write a syslog() wrapper to log to a file the messages 
I need, rather than rely on a working syslog() during boot :(

Francesco
