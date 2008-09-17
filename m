From: Nick Peirson <nick@netcentral.co.uk>
Date: Wed, 17 Sep 2008 16:03:47 +0100
Subject: [Buildroot] Lighttpd and PCRE
In-Reply-To: <48D0CDD3.4070604@netcentral.co.uk>
References: <48D0CDD3.4070604@netcentral.co.uk>
Message-ID: <48D11C53.6020908@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I seem to have pinned down the cause of my problems. Looking through the 
lighttpd config.log I noticed it was using g++ from the host system. A 
slightly brute force approach of chmod'ding g++ to 000, make 
lighttpd-clean, make pcre-clean and then running make again seems to 
have solved the problem.

I'd be interested to know why it was using g++ from the host system, and 
if there's a better solution than my brute force approach to fixing it?

Let me know if there's any more information I can provide to help 
diagnose the cause of this.

Thanks
Nick
